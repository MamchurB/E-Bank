package com.bank.controller;

import com.bank.dto.in.TransactionIn;
import com.bank.dto.in.TransactionTemplateIn;
import com.bank.dto.out.TransactionTemplateOut;
import com.bank.repositories.TransactionTypeRepository;
import com.bank.services.CurrencyTypeServiceImpl;
import com.bank.services.interfaces.BankAccountService;
import com.bank.services.interfaces.TransactionService;
import com.bank.services.interfaces.TransactionTemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/transaction")
public class TransactionTemplateController {
    private final TransactionTemplateService transactionTemplateService;

    private final TransactionService transactionService;
    private final CurrencyTypeServiceImpl currencyTypeService;

    private  final TransactionTypeRepository transactionTypeRepository;
    private final BankAccountService bankAccountService;

    @Autowired
    public TransactionTemplateController(TransactionTemplateService transactionTemplateService,
                                         CurrencyTypeServiceImpl currencyTypeService,
                                         TransactionTypeRepository transactionTypeRepository,
                                         BankAccountService bankAccountService,
                                         TransactionService transactionService) {
        this.transactionTemplateService = transactionTemplateService;
        this.currencyTypeService = currencyTypeService;
        this.transactionTypeRepository = transactionTypeRepository;
        this.bankAccountService = bankAccountService;
        this.transactionService = transactionService;
    }

    @GetMapping("/template")
    @Secured("ROLE_USER")
    public String transactionCurrency(Model model) {
        model.addAttribute("templateForm", new TransactionTemplateIn());
        model.addAttribute("allAccount", bankAccountService.findByUser());
        model.addAttribute("allCurrencyType", currencyTypeService.findAll());
        model.addAttribute("allTypeTransaction", transactionTypeRepository.findAll());
        model.addAttribute("allTemplates", transactionTemplateService.findAllByCurrentUser());
        return "transfer-template";
    }

    @PostMapping("/template")
    @Secured("ROLE_USER")
    public String create(TransactionTemplateIn transactionTemplateIn) {
        transactionTemplateService.create(transactionTemplateIn);
        return "redirect:/transaction/template";
    }

    @GetMapping("/template/{id}")
    @Secured("ROLE_USER")
    public String findOneById(@PathVariable("id") Long id) {
        TransactionTemplateOut transactionTemplateOut = transactionTemplateService.findOneById(id);
        TransactionIn transactionIn = new TransactionIn();
        transactionIn.setSourceAccountNumber(transactionTemplateOut.getSourceAccountNumber());
        transactionIn.setDestinedAccountNumber(transactionTemplateOut.getDestinedAccountNumber());
        transactionIn.setBalance(transactionTemplateOut.getBalance().floatValue());
        transactionIn.setTitle(transactionTemplateOut.getTitle());
        transactionIn.setSourceCurrency(transactionTemplateOut.getSourceCurrency());
        transactionIn.setDestinedCurrency(transactionTemplateOut.getDestinedCurrency());
        transactionIn.setTransactionDirectionId(transactionTemplateOut.getTransactionDirection().getId().toString());
        transactionService.create(transactionIn);
        return "redirect:/transaction/template";
    }
//    @GetMapping
//    @Secured("ROLE_USER")
//    public List<TransactionTemplateOut> findAll() {
//        return transactionTemplateService.findAll();
//    }
//

//
//    @PutMapping("/{id}")
//    @Secured("ROLE_USER")
//    public TransactionTemplateOut updateById(@PathVariable("id") Long id,
//                                             @RequestBody @Valid TransactionTemplateIn transactionTemplateIn) {
//        return transactionTemplateService.update(id, transactionTemplateIn);
//    }
//
//    @GetMapping("/users/all")
//    @Secured("ROLE_USER")
//    public List<TransactionTemplateOut> findAllByCurrentUser() {
//        return transactionTemplateService.findAllByCurrentUser();
//    }
//
//
//    @DeleteMapping("/{id}")
//    @Secured("ROLE_USER")
//    public void deleteById(@PathVariable("id") Long id) {
//        transactionTemplateService.deleteById(id);
//    }
}
