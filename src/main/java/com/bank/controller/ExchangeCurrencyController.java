package com.bank.controller;

import com.bank.dto.in.ExchangeCurrencyIn;
import com.bank.models.CurrencyType;
import com.bank.services.CurrencyTypeServiceImpl;
import com.bank.services.interfaces.BankAccountService;
import com.bank.services.interfaces.ExchangeCurrencyService;
import com.bank.utils.CurrencyConverterImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/exchangecurrency")
public class ExchangeCurrencyController {
    private final ExchangeCurrencyService exchangeCurrencyService;
    private final CurrencyTypeServiceImpl currencyTypeService;
    private final BankAccountService bankAccountService;

    private final CurrencyConverterImpl currencyConverter;

    @Autowired
    public ExchangeCurrencyController(ExchangeCurrencyService exchangeCurrencyService,
                                      CurrencyTypeServiceImpl currencyTypeService,
                                      BankAccountService bankAccountService,
                                      CurrencyConverterImpl currencyConverter) {
        this.exchangeCurrencyService = exchangeCurrencyService;
        this.currencyTypeService = currencyTypeService;
        this.bankAccountService = bankAccountService;
        this.currencyConverter = currencyConverter;
    }
    @GetMapping
    @Secured("ROLE_USER")
    public String transaction(Model model) {
        model.addAttribute("exchangeForm", new ExchangeCurrencyIn());
        model.addAttribute("allAccount", bankAccountService.findByUser());
        model.addAttribute("allCurrencyType", currencyTypeService.findAll());
        return "user/exchange";
    }
    @PostMapping
    @Secured("ROLE_USER")
    public String createCurrency(@Valid ExchangeCurrencyIn exchangeCurrencyIn) {
        exchangeCurrencyService.create(exchangeCurrencyIn);
        return "redirect:/exchangecurrency";
    }
    @GetMapping("/calculate")
    @PreAuthorize("isAuthenticated()")
    @ResponseBody
    public String calculate(@RequestParam float count, @RequestParam String sourceCurrency, @RequestParam String destCurrency) {
        CurrencyType sourceCurrencyType = exchangeCurrencyService.findByName(sourceCurrency);
        CurrencyType distCurrencyType = exchangeCurrencyService.findByName(destCurrency);

         return "You will get " +
                 currencyConverter.convertCurrency(count, sourceCurrencyType, distCurrencyType) + " " + destCurrency;
    }
}
