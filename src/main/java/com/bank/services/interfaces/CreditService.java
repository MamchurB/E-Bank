package com.bank.services.interfaces;

import com.bank.dto.in.CreditIn;
import com.bank.dto.out.CreditOut;
import com.bank.dto.out.CreditStatusOut;
import com.bank.models.enums.CreditStatus;

import java.util.List;

public interface CreditService {
    CreditOut create(CreditIn creditIn);

    CreditOut changeStatus(Long creditId);

    CreditOut changeStatus(Long creditId, CreditStatus.CreditType creditType);

    List<CreditOut> findByUser();

    List<CreditOut> findByCreditType(CreditStatus.CreditType creditType);

    CreditOut findById(Long id);

    List<CreditOut> findActiveByBankAccountId(Long bankAccountId);

    List<CreditStatusOut> findAllCreditStatuses();

    Long countAllByCreditType(CreditStatus.CreditType creditType);
}
