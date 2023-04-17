package com.bank.services;

import com.bank.dto.edit.BankAccTypeEdit;
import com.bank.dto.out.BankAccTypeOut;
import com.bank.exceptions.ApiException;
import com.bank.mappers.BankAccTypeMapper;
import com.bank.models.BankAccType;
import com.bank.repositories.BankAccountTypeRepository;
import com.bank.services.interfaces.BankAccTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BankAccTypeServiceImpl implements BankAccTypeService {
    private final BankAccountTypeRepository bankAccountTypeRepository;

    private final BankAccTypeMapper bankAccTypeMapper;

    @Autowired
    public BankAccTypeServiceImpl(BankAccountTypeRepository bankAccountTypeRepository,
                                  BankAccTypeMapper bankAccTypeMapper) {
        this.bankAccountTypeRepository = bankAccountTypeRepository;
        this.bankAccTypeMapper = bankAccTypeMapper;
    }

    @Override
    public List<BankAccTypeOut> findAll() {
        return bankAccountTypeRepository.findAll()
            .stream()
            .map(bankAccTypeMapper::entityToDto)
            .collect(Collectors.toList());
    }

    @Override
    public BankAccTypeOut update(Long id, BankAccTypeEdit bankAccTypeEdit) {
        BankAccType bankAccType = bankAccountTypeRepository.findById(id)
            .orElseThrow(() -> new ApiException("Exception.notFound", null));

        bankAccType.setExchangeCurrencyCommission(bankAccTypeEdit.getExchangeCurrencyCommission().floatValue());
        bankAccType.setTransactionComission(bankAccTypeEdit.getTransactionComission().floatValue());

        return bankAccTypeMapper.entityToDto(bankAccountTypeRepository.save(bankAccType));
    }

    @Override
    public BankAccTypeOut findById(Long id) {
        return bankAccTypeMapper.entityToDto(
            bankAccountTypeRepository.findById(id).orElseThrow(() -> new ApiException("Exception.notFound", null))
        );
    }
}
