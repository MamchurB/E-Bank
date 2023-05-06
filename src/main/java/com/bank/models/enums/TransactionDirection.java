package com.bank.models.enums;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "transaction_direction")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TransactionDirection {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public int value;
    @Enumerated(EnumType.STRING)
    @Column(name = "transaction_type")
    private TransactionType transactionType;

    public enum TransactionType {

        EDUCATION(1),
        FAMILY(2),
        PRODUCTS(3),
        TRANSPORT(4),
        GIFTS(5),
        OTHER(6);

        public int getValue() {
            return value;
        }

        int value;
        TransactionType(int i) {
            this.value = i;
        }

    }
}


