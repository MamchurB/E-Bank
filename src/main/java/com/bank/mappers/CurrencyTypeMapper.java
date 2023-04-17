package com.bank.mappers;

import com.bank.dto.in.CurrencyTypeIn;
import com.bank.dto.out.CurrencyTypeOut;
import com.bank.models.CurrencyType;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper (componentModel = "spring")
public interface CurrencyTypeMapper
{
        CurrencyType DTOtoEntity ( CurrencyTypeIn currencyTypeIn );

        CurrencyTypeOut entityToDTO ( CurrencyType currencyType );
}