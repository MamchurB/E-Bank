package com.bank.controller;

import com.bank.dto.in.TransactionIn;
import com.bank.dto.out.TransactionOut;
import com.bank.models.user.User;
import com.bank.services.CurrencyTypeServiceImpl;
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

    @Autowired
    public TransactionController(TransactionService transactionService,
                                 CurrencyTypeServiceImpl currencyTypeService) {
        this.transactionService = transactionService;
        this.currencyTypeService = currencyTypeService;
    }

    @GetMapping
    @Secured("ROLE_USER")
    public String transaction(Model model) {
        model.addAttribute("transferForm", new TransactionIn());
        System.out.println("transfer");
        model.addAttribute("allCurrencyType", currencyTypeService.findAll());
        return "transfer";
    }

    @PostMapping
    @Secured("ROLE_USER")
    public String create(@Valid TransactionIn transactionIn) {
        System.out.println("create transaction");
        transactionService.create(transactionIn);
        System.out.println("finish transaction");
        return "login";
    }
//    @GetMapping
//    public List<TransactionOut> findAll() {
//        return transactionService.findAll();
//    }

    @GetMapping("/byAccount/{id}")
    public List<TransactionOut> findAllByBankAccountId(@PathVariable("id") Long id) {
        return transactionService.findAllByBankAccountId(id);
    }
}
