package com.bank.mappers;

import com.bank.dto.in.ExchangeCurrencyIn;
import com.bank.dto.out.ExchangeCurrencyOut;
import com.bank.models.ExchangeCurrency;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper (componentModel = "spring")
public interface ExchangeCurrencyMapper
{
        ExchangeCurrency DTOtoEntity ( ExchangeCurrencyIn exchangeCurrencyIn );

        ExchangeCurrencyOut entityToDTO ( ExchangeCurrency exchangeCurrency );
}
