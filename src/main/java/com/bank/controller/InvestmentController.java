package com.bank.controller;

import com.bank.dto.in.CreditIn;
import com.bank.dto.in.InvestmentIn;
import com.bank.dto.out.CreditOut;
import com.bank.dto.out.InvestmentOut;
import com.bank.services.interfaces.BankAccountService;
import com.bank.services.interfaces.InvestmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/investments")
public class InvestmentController {

    private final InvestmentService investmentService;
    private final BankAccountService bankAccountService;
    @Autowired
    public InvestmentController(InvestmentService investmentService,
                                BankAccountService bankAccountService) {
        this.investmentService = investmentService;
        this.bankAccountService = bankAccountService;
    }
    @GetMapping
    @Secured("ROLE_USER")
    public String deposit(Model model) {
        model.addAttribute("depositForm", new InvestmentIn());
        model.addAttribute("allAccount", bankAccountService.findByUser());
        return "deposit";
    }
    @PostMapping
    @Secured("ROLE_USER")
    public String create(InvestmentIn investmentIn) {
        investmentService.create(investmentIn);
        return "redirect:/investments";
    }
    @GetMapping("user-deposits")
    @Secured("ROLE_USER")
    public String userCredits(Model model) {
        model.addAttribute("allUserDeposits", investmentService.findAllByUser());
        model.addAttribute("depositDetail", investmentService.findAllByUser().get(0));
        return "user-deposits";
    }
    @RequestMapping(value="/byId/{id}", method = RequestMethod.POST)
    @ResponseBody
    public InvestmentOut practicePagePost(@PathVariable("id") Long id,
                                      Model model){
        return investmentService.findById(id);
    }

    @GetMapping("/byId/{id}")
    @Secured({"ROLE_EMPLOYEE", "ROLE_USER"})
    public void findById(@PathVariable("id") Long id, Model model) {
        model.addAttribute("depositDetail", investmentService.findById(id));
    }
    @GetMapping("/byUser")
    @Secured("ROLE_USER")
    public List<InvestmentOut> findAllByUser() {
        return investmentService.findAllByUser();
    }

    @PatchMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public InvestmentOut updateStatus(@PathVariable("id") Long id) {
        return investmentService.updateStatus(id);
    }



    @Secured("ROLE_EMPLOYEE")
    @GetMapping("/byBankAccount/{id}")
    public List<InvestmentOut> findAllActiveByBankAccountId(@PathVariable("id") Long id){
        return investmentService.findActiveByBankAccountId(id);
    }
}
