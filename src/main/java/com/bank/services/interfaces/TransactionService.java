package com.bank.services.interfaces;

import com.bank.dto.in.TransactionIn;
import com.bank.dto.out.TransactionOut;

import java.util.List;

public interface TransactionService {
    TransactionOut create(TransactionIn transactionDTO);

    List<TransactionOut> findAll();

    List<TransactionOut> findAllByBankAccountId(Long bankAccountId);
}