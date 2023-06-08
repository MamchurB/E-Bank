package com.bank.controller;

import com.bank.dto.in.TransactionIn;
import com.bank.dto.out.TransactionOut;
import com.bank.repositories.TransactionTypeRepository;
import com.bank.services.CurrencyTypeServiceImpl;
import com.bank.services.interfaces.BankAccountService;
import com.bank.services.interfaces.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/transaction")
public class TransactionController {
    private final TransactionService transactionService;
    private final CurrencyTypeServiceImpl currencyTypeService;

    private  final TransactionTypeRepository transactionTypeRepository;
    private final BankAccountService bankAccountService;
    @Autowired
    public TransactionController(TransactionService transactionService,
                                 CurrencyTypeServiceImpl currencyTypeService,
                                 BankAccountService bankAccountService,
                                 TransactionTypeRepository transactionTypeRepository) {
        this.transactionService = transactionService;
        this.currencyTypeService = currencyTypeService;
        this.bankAccountService = bankAccountService;
        this.transactionTypeRepository = transactionTypeRepository;
    }

    @GetMapping("/currency")
    @Secured("ROLE_USER")
    public String transactionCurrency(Model model) {
        model.addAttribute("transferForm", new TransactionIn());
        model.addAttribute("allAccount", bankAccountService.findByUser());
        model.addAttribute("allCurrencyType", currencyTypeService.findAll());
        model.addAttribute("allTypeTransaction", transactionTypeRepository.findAll());
        return "user/transfer-currency";
    }

    @PostMapping("/currency")
    @Secured("ROLE_USER")
    public String createCurrency(@Valid TransactionIn transactionIn, Model model) {
        model.addAttribute("transferConfirmation", transactionIn);
        return "user/transfer-confirmation";
    }
    @GetMapping
    @Secured("ROLE_USER")
    public String transaction(Model model) {
        model.addAttribute("transferForm", new TransactionIn());
        model.addAttribute("allAccount", bankAccountService.findByUser());
        model.addAttribute("allTypeTransaction", transactionTypeRepository.findAll());
        return "user/transfer";
    }

    @PostMapping
    @Secured("ROLE_USER")
    public String create(@Valid TransactionIn transactionIn, Model model) {
        model.addAttribute("transferConfirmation", transactionIn);
        return "user/transfer-confirmation";
    }

    @PostMapping("/confirmation")
    @Secured("ROLE_USER")
    public String confirmation(@Valid TransactionIn transactionIn) {
        transactionService.create(transactionIn);
        return "user/finish";
    }
    @GetMapping("/cancel")
    @Secured("ROLE_USER")
    public String transaction() {
        return "redirect:/transaction";
    }


}
