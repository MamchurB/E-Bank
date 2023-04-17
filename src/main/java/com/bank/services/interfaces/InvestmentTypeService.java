package com.bank.services.interfaces;

import com.bank.dto.out.InvestmentTypeOut;

import java.util.List;

public interface InvestmentTypeService {
    List<InvestmentTypeOut> findAll();
}
