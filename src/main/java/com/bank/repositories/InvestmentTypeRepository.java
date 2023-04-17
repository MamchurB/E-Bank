package com.bank.repositories;

import com.bank.models.enums.InvestmentType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvestmentTypeRepository extends JpaRepository<InvestmentType, Long> {
    InvestmentType findByInvestmentStatus(InvestmentType.InvestmentStatus investmentStatus);
}
