package com.bank.repositories;

import com.bank.models.ExchangeCurrency;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExchangeCurrencyRepository extends JpaRepository<ExchangeCurrency, Long>
{
}
