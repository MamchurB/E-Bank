package com.bank.repositories;

import com.bank.models.CurrencyType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CurrencyTypeRepository extends JpaRepository<CurrencyType, Long>
{
        Optional<CurrencyType> findByName (String name);

}
