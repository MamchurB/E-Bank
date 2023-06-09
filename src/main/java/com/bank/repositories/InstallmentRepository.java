package com.bank.repositories;

import com.bank.models.Installment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InstallmentRepository extends JpaRepository<Installment, Long> {
    List<Installment> findAllByCredit_Id(Long id);
}
