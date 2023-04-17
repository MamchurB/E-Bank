package com.bank.services.interfaces;

import com.bank.dto.edit.CurrencyTypeEdit;
import com.bank.dto.in.CurrencyTypeIn;
import com.bank.dto.out.CurrencyTypeOut;

import java.util.List;

public interface CurrencyTypeService {
    List<CurrencyTypeOut> findAll();

    CurrencyTypeOut create(CurrencyTypeIn currencyTypeIn);

    CurrencyTypeOut update(Long id, CurrencyTypeEdit currencyTypeEdit);

    CurrencyTypeOut findById(Long id);
}
