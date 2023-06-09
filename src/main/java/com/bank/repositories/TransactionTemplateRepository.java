package com.bank.repositories;

import com.bank.models.TransactionTemplate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TransactionTemplateRepository extends JpaRepository<TransactionTemplate, Long> {

    List<TransactionTemplate> findAllByUser_Identifier(String identifier);
}
