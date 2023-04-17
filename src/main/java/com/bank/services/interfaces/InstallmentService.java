package com.bank.services.interfaces;

import com.bank.dto.in.InstallmentIn;
import com.bank.dto.out.InstallmentOut;

import java.util.List;

public interface InstallmentService {
    InstallmentOut create(InstallmentIn installmentIn);

    List<InstallmentOut> findAllByCreditId(Long id);
}
