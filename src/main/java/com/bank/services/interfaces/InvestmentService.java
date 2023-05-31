package com.bank.services.interfaces;

import com.bank.dto.in.InvestmentIn;
import com.bank.dto.out.InvestmentOut;

import java.util.List;

public interface InvestmentService {
    List<InvestmentOut> findAll();

    List<InvestmentOut> findAllByUser();

    InvestmentOut findById(Long id);

    Long findInvestmentCountByType(Long id);

    InvestmentOut updateStatus(Long id);

    InvestmentOut create(InvestmentIn investment);

    List<InvestmentOut> findActiveByBankAccountId(Long bankAccountId);

    void deleteDepositById(Long id);
}