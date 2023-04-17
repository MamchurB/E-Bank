package com.bank.models.enums;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "investment_types")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InvestmentType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "investment_status")
    private InvestmentStatus investmentStatus;

    public enum InvestmentStatus {
        ACTIVE,
        CLOSED
    }
}

