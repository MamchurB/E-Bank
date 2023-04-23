package com.bank.services.interfaces;

import com.bank.dto.edit.BankAccountEdit;
import com.bank.dto.edit.SaldoEdit;
import com.bank.dto.in.BankAccountIn;
import com.bank.dto.out.BankAccountOut;
import com.bank.dto.out.SaldoOut;
import com.bank.dto.out.UserOut;

import java.util.List;

public interface BankAccountService {
    BankAccountOut create(BankAccountIn bankAccountIn, String userIdentifier);

    List<BankAccountOut> findAll();

    List<BankAccountOut> findByUser();

    BankAccountOut findById(Long id);

    Long findBankAccountCountByType(Long id);

    void deleteById(Long id);

    BankAccountOut update(Long id, BankAccountEdit bankAccountEdit);

    SaldoOut updateSaldo(Long id, SaldoEdit saldoEdit);
}
