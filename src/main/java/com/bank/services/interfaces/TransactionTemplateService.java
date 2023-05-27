package com.bank.services.interfaces;

import com.bank.dto.in.TransactionTemplateIn;
import com.bank.dto.out.TransactionTemplateOut;

import java.util.List;

public interface TransactionTemplateService {
    void create(TransactionTemplateIn transactionTemplateIn);

    List<TransactionTemplateOut> findAll();

    TransactionTemplateOut findOneById(Long id);

    TransactionTemplateOut update(Long id, TransactionTemplateIn transactionTemplateIn);

    void deleteById(Long id);

    List<TransactionTemplateOut> findAllByCurrentUser();

}
