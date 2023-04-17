package com.bank.mappers;

import com.bank.dto.out.TransactionOut;
import com.bank.models.Transaction;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring", uses = BankAccountMapper.class)
public interface TransactionMapper {
    TransactionOut entityToDTO(Transaction transaction);
}
