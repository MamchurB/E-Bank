package com.bank.services.interfaces;

import com.bank.dto.in.TransactionIn;
import com.bank.dto.out.TransactionOut;
import com.bank.models.Transaction;
import com.bank.models.enums.TransactionDirection;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface TransactionService {
    TransactionOut create(TransactionIn transactionDTO);

    List<TransactionOut> findAll();

    Transaction findById(Long id);

    void deleteById(Long id);

    List<TransactionOut> findAllByBankAccountId(Long bankAccountId);

    Map<String, String> groupTransactionByTransactionType(Long bankAccountId);
}