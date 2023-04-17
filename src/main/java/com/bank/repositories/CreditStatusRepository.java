package com.bank.repositories;

import com.bank.models.enums.CreditStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CreditStatusRepository extends JpaRepository<CreditStatus, Long> {
    CreditStatus findByCreditType(CreditStatus.CreditType creditType);

}
