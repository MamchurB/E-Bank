package com.bank.services.interfaces;

import com.bank.dto.edit.BankAccTypeEdit;
import com.bank.dto.out.BankAccTypeOut;

import java.util.List;

public interface BankAccTypeService {
    List<BankAccTypeOut> findAll();

    BankAccTypeOut update(Long id, BankAccTypeEdit bankAccTypeEdit);

    BankAccTypeOut findById(Long id);
}
