package com.bank.services;

import com.bank.dto.in.CreditIn;
import com.bank.dto.out.CreditOut;
import com.bank.dto.out.CreditStatusOut;
import com.bank.dto.out.TransactionOut;
import com.bank.mappers.CreditMapper;
import com.bank.mappers.CreditStatusMapper;
import com.bank.models.Credit;
import com.bank.models.Saldo;
import com.bank.models.enums.CreditStatus;
import com.bank.models.enums.TransactionDirection;
import com.bank.repositories.CreditRepository;
import com.bank.repositories.CreditStatusRepository;
import com.bank.repositories.SaldoRepository;
import com.bank.services.interfaces.CreditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class CreditServiceImpl implements CreditService {
    private final CreditRepository creditRepository;

    private final SaldoRepository saldoRepository;

    private final CreditMapper creditMapper;

    private final CreditStatusRepository creditStatusRepository;

    private final CreditStatusMapper creditStatusMapper;

    @Autowired
    public CreditServiceImpl(CreditRepository creditRepository,
                             CreditMapper creditMapper,
                             SaldoRepository saldoRepository,
                             CreditStatusRepository creditStatusRepository,
                             CreditStatusMapper creditStatusMapper) {
        this.creditRepository = creditRepository;
        this.creditMapper = creditMapper;
        this.saldoRepository = saldoRepository;
        this.creditStatusRepository = creditStatusRepository;
        this.creditStatusMapper = creditStatusMapper;
    }

    @Override
    public CreditOut create(CreditIn creditIn) {
        Credit mapped = creditMapper.DTOtoEntity(creditIn);
        mapped.setBalancePaid(BigDecimal.ZERO);

        Saldo destinedSaldo = saldoRepository.findById(creditIn.getDestinedSaldoId())
            .orElseThrow(() -> new RuntimeException("Not found"));

        mapped.setAcceptedAlready(false);
        mapped.setCurrency(destinedSaldo.getCurrencyType().getName());
        mapped.setDestinedSaldo(destinedSaldo);
        mapped.setInstallments(new HashSet<>());
        mapped.setCreditStatus(creditStatusRepository.findByCreditType(CreditStatus.CreditType.AWAITING));

        BigDecimal installmentAmount = new BigDecimal(
            creditIn.getTotalBalance().floatValue() / creditIn.getTotalInstallmentCount()
        ).setScale(2, BigDecimal.ROUND_UP);
        mapped.setInstallmentAmount(installmentAmount);

        return creditMapper.entityToDTO(creditRepository.save(mapped));
    }

    @Override
    public CreditOut changeStatus(Long creditId) {
        Credit credit = creditRepository.findById(creditId).orElseThrow(() -> new RuntimeException("Credit not found"));
        switch (credit.getCreditStatus().getCreditType()) {
            case ACTIVE:
                credit.setCreditStatus(creditStatusRepository.findByCreditType(CreditStatus.CreditType.PAID));
                break;
            case CANCELED:
                credit.setCreditStatus(creditStatusRepository.findByCreditType(CreditStatus.CreditType.AWAITING));
                break;
            case PAID:
                credit.setCreditStatus(creditStatusRepository.findByCreditType(CreditStatus.CreditType.CANCELED));
                break;
            case AWAITING:
                credit.setCreditStatus(creditStatusRepository.findByCreditType(CreditStatus.CreditType.ACTIVE));
                if (!credit.isAcceptedAlready()) {
                    credit.setAcceptedAlready(true);
                    transferBalance(credit);
                }
                break;
        }

        return creditMapper.entityToDTO(creditRepository.save(credit));
    }

    @Override
    public CreditOut changeStatus(Long creditId, CreditStatus.CreditType creditType) {
        Credit credit = creditRepository.findById(creditId).orElseThrow(() -> new RuntimeException("Credit not found"));
        credit.setCreditStatus(creditStatusRepository.findByCreditType(creditType));

        if (credit.getCreditStatus().getCreditType() == CreditStatus.CreditType.ACTIVE && !credit.isAcceptedAlready()) {
            credit.setAcceptedAlready(true);
            transferBalance(credit);
        }

        return creditMapper.entityToDTO(creditRepository.save(credit));
    }

    @Override
    public List<CreditOut> findByUser() {
        return creditRepository.findAllByDestinedSaldo_BankAccount_User_Identifier(
            SecurityContextHolder.getContext().getAuthentication().getName()
        ).stream()
            .map(creditMapper::entityToDTO)
            .collect(Collectors.toList());
    }

    @Override
    public List<CreditOut> findByCreditType(CreditStatus.CreditType creditType) {
        return creditRepository.findAllByCreditStatus_CreditType(creditType)
            .stream()
            .map(creditMapper::entityToDTO)
            .collect(Collectors.toList());
    }

    @Override
    public CreditOut findById(Long id) {
        return creditMapper.entityToDTO(creditRepository.findById(id).orElseThrow(() -> new RuntimeException("Credit not found")));
    }

    @Override
    public List<CreditOut> findActiveByBankAccountId(Long bankAccountId) {
        return creditRepository.findAllByCreditStatusAndDestinedSaldo_BankAccount_Id(creditStatusRepository.findByCreditType(CreditStatus.CreditType.ACTIVE), bankAccountId)
            .stream()
            .map(creditMapper::entityToDTO)
            .collect(Collectors.toList());
    }

    @Override
    public List<CreditStatusOut> findAllCreditStatuses() {
        return creditStatusRepository.findAll()
            .stream()
            .map(creditStatusMapper::entityToDTO)
            .collect(Collectors.toList());
    }

    @Override
    public Long countAllByCreditType(CreditStatus.CreditType creditType) {
        return creditRepository.countAllByCreditStatus_CreditType(creditType);
    }

    private void transferBalance(Credit credit) {
        Saldo destinedSaldo = credit.getDestinedSaldo();
        destinedSaldo.setBalance(credit.getDestinedSaldo().getBalance().add(credit.getTotalBalance()));
        saldoRepository.save(destinedSaldo);
    }

    public Map<String, String> groupCreditByStatus() {
         Map <CreditStatus.CreditType, Long> map = creditRepository.findAll()
                .stream()
                .map(creditMapper::entityToDTO)
                .collect(Collectors.groupingBy(o -> o.getCreditStatus().getCreditType(), Collectors.counting()));

       Long sum = map.values().stream().reduce(0L, Long::sum);

        Map<String, Double> nameAndPercent = map.entrySet().stream().collect(Collectors.toMap(
                entry -> entry.getKey().name(),
                entry -> (entry.getValue() * 100.0 / sum)));
        Map<String, String> groupByNameAndValue = new HashMap<>();
        groupByNameAndValue.put("label", nameAndPercent.keySet().toString());
        groupByNameAndValue.put("value", nameAndPercent.values().toString());
        return groupByNameAndValue;
    }

}
