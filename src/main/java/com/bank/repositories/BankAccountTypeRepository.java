package com.bank.repositories;

import com.bank.models.BankAccType;
import com.bank.models.enums.BankAccountType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BankAccountTypeRepository extends JpaRepository<BankAccType, Long> {
    BankAccType findByBankAccountType(BankAccountType bankAccountType);
}
