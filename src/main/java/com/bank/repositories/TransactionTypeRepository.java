package com.bank.repositories;

import com.bank.models.enums.TransactionDirection;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TransactionTypeRepository extends JpaRepository<TransactionDirection, Long> {
    List<TransactionDirection> findAll();

    Optional<TransactionDirection> findById(Long id);
}
