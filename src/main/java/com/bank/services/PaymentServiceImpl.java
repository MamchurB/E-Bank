package com.bank.services;

import com.bank.dto.in.PaymentIn;
import com.bank.dto.out.PaymentOut;
import com.bank.mappers.PaymentMapper;
import com.bank.models.BankAccount;
import com.bank.models.CurrencyType;
import com.bank.models.Payment;
import com.bank.models.Saldo;
import com.bank.repositories.BankAccountRepository;
import com.bank.repositories.CurrencyTypeRepository;
import com.bank.repositories.PaymentRepository;
import com.bank.services.interfaces.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;
import java.time.Instant;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PaymentServiceImpl implements PaymentService {
    private final PaymentRepository paymentRepository;

    private final CurrencyTypeRepository currencyTypeRepository;

    private final BankAccountRepository bankAccountRepository;

    private final PaymentMapper paymentMapper;

    @Autowired
    public PaymentServiceImpl(PaymentRepository paymentRepository,
                              CurrencyTypeRepository currencyTypeRepository,
                              BankAccountRepository bankAccountRepository,
                              PaymentMapper paymentMapper) {
        this.paymentRepository = paymentRepository;
        this.currencyTypeRepository = currencyTypeRepository;
        this.bankAccountRepository = bankAccountRepository;
        this.paymentMapper = paymentMapper;
    }


    @Override
    public PaymentOut create(@NotNull PaymentIn paymentIn) {
        BankAccount bankAccount = bankAccountRepository.findByNumberAndRemovedFalse(paymentIn.getDestinedBankAccountNumber())
            .orElseThrow(() -> new RuntimeException("Source bank account not found"));
        CurrencyType currencyType = currencyTypeRepository.findByName(
            paymentIn.getSourceCurrencyType()).orElseThrow(() -> new RuntimeException("Source currency not found"));
        Saldo destinedSaldo = bankAccount.getSaldos()
            .stream()
            .filter(e -> e.getCurrencyType() == currencyType)
            .findFirst()
            .orElseThrow(() -> new RuntimeException("Destined bank account has no saldo with provided currency type"));

        destinedSaldo.setBalance(destinedSaldo.getBalance().add(paymentIn.getBalance()));

        return paymentMapper.entityToDto(paymentRepository.save(Payment.builder()
            .date(Instant.now())
            .balance(paymentIn.getBalance())
            .sourceCurrencyType(currencyType)
            .destinedBankAccount(bankAccount)
            .build())
        );
    }

    @Override
    public List<PaymentOut> findAllByBankAccountId(Long bankAccountId) {
        if (!bankAccountRepository.existsById(bankAccountId)) {
            throw new RuntimeException("Bank account not found");
        }
        return paymentRepository.findAllByDestinedBankAccount_Id(bankAccountId)
            .stream()
            .map(paymentMapper::entityToDto)
            .collect(Collectors.toList());
    }

    @Override
    public List<PaymentOut> findAll() {
        return paymentRepository.findAll()
            .stream()
            .map(paymentMapper::entityToDto)
            .collect(Collectors.toList());
    }
}
