package com.bank.mappers;

import com.bank.dto.in.InvestmentIn;
import com.bank.dto.out.InvestmentOut;
import com.bank.models.Investment;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper(componentModel = "spring", uses = InvestmentTypeMapper.class)
public interface InvestmentMapper {
    InvestmentOut entityToDTO(Investment investment);

    Investment dtoToEntity(InvestmentIn investmentIn);

    List<InvestmentOut> entityToDTO(List<Investment> investments);
}
