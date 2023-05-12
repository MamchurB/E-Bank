package com.bank.controller;

import com.bank.dto.in.ExchangeCurrencyIn;
import com.bank.dto.in.TransactionIn;
import com.bank.dto.out.ExchangeCurrencyOut;
import com.bank.services.CurrencyTypeServiceImpl;
import com.bank.services.interfaces.BankAccountService;
import com.bank.services.interfaces.ExchangeCurrencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.math.BigDecimal;

@Controller
@RequestMapping("/exchangecurrency")
public class ExchangeCurrencyController {
    private final ExchangeCurrencyService exchangeCurrencyService;
    private final CurrencyTypeServiceImpl currencyTypeService;
    private final BankAccountService bankAccountService;

    @Autowired
    public ExchangeCurrencyController(ExchangeCurrencyService exchangeCurrencyService,
                                      CurrencyTypeServiceImpl currencyTypeService,
                                      BankAccountService bankAccountService) {
        this.exchangeCurrencyService = exchangeCurrencyService;
        this.currencyTypeService = currencyTypeService;
        this.bankAccountService = bankAccountService;
    }
    @GetMapping
    @Secured("ROLE_USER")
    public String transaction(Model model) {
        model.addAttribute("exchangeForm", new ExchangeCurrencyIn());
        model.addAttribute("allAccount", bankAccountService.findByUser());
        model.addAttribute("allCurrencyType", currencyTypeService.findAll());
        return "exchange-currency";
    }
    @PostMapping
    @Secured("ROLE_USER")
    public String createCurrency(@Valid ExchangeCurrencyIn exchangeCurrencyIn) {
        exchangeCurrencyService.create(exchangeCurrencyIn);
        return "redirect:/exchangecurrency";
    }
//    @PostMapping
//    @PreAuthorize("isAuthenticated()")
//    public ExchangeCurrencyOut create(@RequestBody ExchangeCurrencyIn exchangeCurrencyIn) {
//        return exchangeCurrencyService.create(exchangeCurrencyIn);
//    }
//
//    @PostMapping("/calculate")
//    @PreAuthorize("isAuthenticated()")
//    public BigDecimal calculate(@RequestBody ExchangeCurrencyIn exchangeCurrencyIn) {
//        return exchangeCurrencyService.calculate(exchangeCurrencyIn);
//    }
}
