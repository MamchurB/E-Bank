package com.bank.controller;

import com.bank.dto.in.TransactionIn;
import com.bank.dto.out.TransactionOut;
import com.bank.models.Transaction;
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
    public String create(@Valid TransactionIn transactionIn, Model model) {
        System.out.println("create transaction");
        model.addAttribute("transferConfirmation", transactionIn);
        //TransactionOut transaction = transactionService.create(transactionIn);
        System.out.println("finish transaction");
        return "transfer-confirmation";
    }

    @PostMapping("/confirmation")
    @Secured("ROLE_USER")
    public String confirmation(@Valid TransactionIn transactionIn, Model model) {
       // model.addAttribute("transferConfirmation", transactionService.findById(id));
        transactionService.create(transactionIn);
        System.out.println("confirmation");
        return "finish";
    }
    @GetMapping("/cancel")
    @Secured("ROLE_USER")
    public String transaction() {
        return "redirect:/transaction";
    }
//    @GetMapping("/finish")
//    @Secured("ROLE_USER")
//    public String finish() {
//        return "finish";
//    }

//    @GetMapping("/delete/{id}")
//    @Secured("ROLE_USER")
//    public String cancel(@PathVariable("id") Long id) {
//        transactionService.deleteById(id);
//        return "redirect:/transaction";
//    }
//    @GetMapping
//    public List<TransactionOut> findAll() {
//        return transactionService.findAll();
//    }

    @GetMapping("/byAccount/{id}")
    public List<TransactionOut> findAllByBankAccountId(@PathVariable("id") Long id) {
        return transactionService.findAllByBankAccountId(id);
    }
}
