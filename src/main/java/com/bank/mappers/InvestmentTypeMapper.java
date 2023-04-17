package com.bank.mappers;

import com.bank.dto.out.InvestmentTypeOut;
import com.bank.models.enums.InvestmentType;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper(componentModel = "spring")
public interface InvestmentTypeMapper {
    InvestmentTypeOut entityToDTO(InvestmentType investmentType);

    List<InvestmentTypeOut> entityToDTO(List<InvestmentType> investments);
}
