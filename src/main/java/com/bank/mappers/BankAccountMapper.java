package com.bank.mappers;

import com.bank.dto.out.BankAccountOut;
import com.bank.models.BankAccount;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring", uses = {SaldoMapper.class, BankAccTypeMapper.class})
public interface BankAccountMapper {
    BankAccountOut entityToDTO(BankAccount bankAccount);
}
