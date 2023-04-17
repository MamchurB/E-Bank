package com.bank.utils;

import com.bank.models.CurrencyType;

import java.math.BigDecimal;

public interface CurrencyConverter
{
        BigDecimal convertCurrency ( float currency, CurrencyType sourceCurrency, CurrencyType destinedCurrency );
}
