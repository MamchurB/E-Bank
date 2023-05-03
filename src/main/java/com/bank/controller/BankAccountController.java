package com.bank.controller;

import com.bank.dto.edit.BankAccountEdit;
import com.bank.dto.edit.SaldoEdit;
import com.bank.dto.in.BankAccountIn;
import com.bank.dto.out.BankAccountOut;
import com.bank.dto.out.SaldoOut;
import com.bank.dto.out.UserOut;
import com.bank.models.user.User;
import com.bank.services.CurrencyTypeServiceImpl;
import com.bank.services.UserServiceImpl;
import com.bank.services.interfaces.BankAccountService;
import com.bank.services.interfaces.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/bankaccount")
public class BankAccountController {
    private final BankAccountService bankAccountService;
    private final UserServiceImpl userService;
    private final TransactionService transactionService;

    private final CurrencyTypeServiceImpl currencyTypeService;

    @Autowired
    public BankAccountController(BankAccountService bankAccountService,
                                 UserServiceImpl userService,
                                 TransactionService transactionService,
                                 CurrencyTypeServiceImpl currencyTypeService) {
        this.bankAccountService = bankAccountService;
        this.userService = userService;
        this.transactionService = transactionService;
        this.currencyTypeService = currencyTypeService;
    }
    @GetMapping("/main")
    @Secured("ROLE_USER")
    public String account(Model model) {
        String user =  SecurityContextHolder.getContext().getAuthentication().getName();
        UserOut userOut = userService.findByIdentifier(user);
        model.addAttribute("name", userOut.getAddress().getName() + " " + userOut.getAddress().getSurname());
        model.addAttribute("allBankAccount", bankAccountService.findByUser());
        return "index";
    }
    @GetMapping("/card-details/{id}")
    @Secured("ROLE_USER")
    public String cardDetails(Model model, @PathVariable("id") Long id) {
        model.addAttribute("bankAccount", bankAccountService.findById(id));
        model.addAttribute("transactionsById", transactionService.findAllByBankAccountId(id));
        model.addAttribute("bankAccountId", id);
        HashMap<String, Object> map = new HashMap<>();
        return "card-details";
    }

    @GetMapping("/close-account/{id}")
    @Secured("ROLE_USER")
    public String cardClose(Model model, @PathVariable("id") Long id) {
        bankAccountService.deleteById(id);
        return "redirect:/bankaccount/main";
    }
    @GetMapping
    @Secured("ROLE_EMPLOYEE")
    public List<BankAccountOut> findAll() {
        return bankAccountService.findAll();
    }



    @PostMapping
    @Secured("ROLE_USER")
    public BankAccountOut create(@RequestBody BankAccountIn bankAccountIn,
                                 @AuthenticationPrincipal String username) {
        return bankAccountService.create(bankAccountIn, username);
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public BankAccountOut findById(@PathVariable("id") Long id) {
        return bankAccountService.findById(id);
    }

    @GetMapping("/{id}/accountCount")
    @Secured("ROLE_ADMIN")
    public Long getBankAccountCountByType(@PathVariable("id") Long id) {
        return bankAccountService.findBankAccountCountByType(id);
    }

    @Secured({"ROLE_USER", "ROLE_EMPLOYEE"})
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteById(@PathVariable("id") Long id) {
        bankAccountService.deleteById(id);
    }

    @Secured("ROLE_EMPLOYEE")
    @PutMapping("/{id}")
    public BankAccountOut update(@PathVariable("id") Long id,
                                 @RequestBody @Valid BankAccountEdit bankAccountEdit) {
        return bankAccountService.update(id, bankAccountEdit);
    }

    @Secured("ROLE_EMPLOYEE")
    @PutMapping("/saldo/{id}")
    public SaldoOut update(@PathVariable("id") Long id,
                           @RequestBody @Valid SaldoEdit saldoEdit) {
        return bankAccountService.updateSaldo(id, saldoEdit);
    }

}
