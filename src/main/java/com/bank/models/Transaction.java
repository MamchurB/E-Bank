package com.bank.models;

import com.bank.models.enums.TransactionDirection;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Table (name = "transactions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Transaction
{
        @Id
        @GeneratedValue (strategy = GenerationType.IDENTITY)
        private Long id;

        @Column (name = "date")
        private Instant date;

        @Column (name = "balance")
        private BigDecimal balance;

        @Column (name = "balance_with_commission")
        private BigDecimal balanceWithCommission;

        @ManyToOne
        @JoinColumn (name = "transaction_direction_id", nullable = false)
        private TransactionDirection transactionDirection;

        @ManyToOne
        @JoinColumn (name = "source_bank_account_id", nullable = false)
        private BankAccount sourceBankAccount;

        @Column (name = "title")
        private String title;

        @ManyToOne
        @JoinColumn (name = "destined_bank_account_id")
        private BankAccount destinedBankAccount;

        @ManyToOne
        @JoinColumn(name="source_currency_type_id")
        private CurrencyType sourceCurrencyType;

        @ManyToOne
        @JoinColumn(name="destined_currency_type_id")
        private CurrencyType destinedCurrencyType;
}
