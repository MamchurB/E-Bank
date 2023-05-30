package com.bank.services.interfaces;

import com.bank.dto.in.ExchangeCurrencyIn;
import com.bank.dto.out.ExchangeCurrencyOut;
import com.bank.models.CurrencyType;

import java.math.BigDecimal;

public interface ExchangeCurrencyService
{
        ExchangeCurrencyOut create ( ExchangeCurrencyIn exchangeCurrencyIn );

        BigDecimal calculate(ExchangeCurrencyIn exchangeCurrencyIn);

    CurrencyType findByName(String name);
}
