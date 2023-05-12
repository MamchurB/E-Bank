package com.bank.repositories;

import com.bank.models.Transaction;
import com.bank.models.enums.TransactionDirection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {
    @Query("SELECT t " +
        "FROM Transaction t " +
        "JOIN t.sourceBankAccount s " +
        "JOIN t.destinedBankAccount d " +
        "WHERE s.id = :id OR d.id = :id " +
        "ORDER BY t.date DESC"
    )
    List<Transaction> findTransactionsByBankAccountId(@Param("id") Long id);

    @Query("SELECT t " +
            "FROM Transaction t " +
            "JOIN t.sourceBankAccount s " +
            "JOIN t.destinedBankAccount d " +
            "JOIN t.transactionDirection e " +
            "WHERE (s.id = :id OR d.id = :id) AND (e.transactionType = :typeId) " +
            "ORDER BY t.date DESC"
    )
    List<Transaction> findTransactionsByBankAccountIdAndTransactionType(@Param("id") Long id, @Param("typeId") TransactionDirection.TransactionType transactionType);
}
