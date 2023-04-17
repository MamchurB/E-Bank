package com.bank.services;

import com.bank.dto.out.InvestmentTypeOut;
import com.bank.mappers.InvestmentTypeMapper;
import com.bank.repositories.InvestmentTypeRepository;
import com.bank.services.interfaces.InvestmentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvestmentTypeServiceImpl implements InvestmentTypeService {

    private final InvestmentTypeRepository investmentTypeRepository;

    private final InvestmentTypeMapper investmentTypeMapper;

    @Autowired
    public InvestmentTypeServiceImpl(InvestmentTypeRepository investmentTypeRepository,
                                     InvestmentTypeMapper investmentTypeMapper) {
        this.investmentTypeRepository = investmentTypeRepository;
        this.investmentTypeMapper = investmentTypeMapper;
    }

    @Override
    public List<InvestmentTypeOut> findAll() {
        return investmentTypeMapper.entityToDTO(investmentTypeRepository.findAll());
    }

}
