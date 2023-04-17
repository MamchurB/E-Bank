package com.bank.repositories;

import com.bank.models.Investment;
import com.bank.models.enums.InvestmentType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InvestmentRepository extends JpaRepository<Investment, Long> {
    List<Investment> findAllByDestinedSaldo_BankAccount_User_Identifier(String identifier);

    Long countAllByInvestmentType(InvestmentType investmentType);

    List<Investment> findAllByInvestmentTypeAndDestinedSaldo_BankAccount_Id(InvestmentType investmentType, Long id);
}
