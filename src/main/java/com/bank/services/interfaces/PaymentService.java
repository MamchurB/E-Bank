package com.bank.services.interfaces;

import com.bank.dto.in.PaymentIn;
import com.bank.dto.out.PaymentOut;

import java.util.List;

public interface PaymentService {
    PaymentOut create(PaymentIn paymentIn);

    List<PaymentOut> findAllByBankAccountId(Long bankAccountId);

    List<PaymentOut> findAll();
}
