package com.bank.controller;

import com.bank.dto.in.CreditIn;
import com.bank.dto.in.InvestmentIn;
import com.bank.dto.in.PaymentIn;
import com.bank.dto.out.BankAccountOut;
import com.bank.dto.out.CreditOut;
import com.bank.dto.out.InvestmentOut;
import com.bank.dto.out.PaymentOut;
import com.bank.services.PaymentServiceImpl;
import com.bank.services.interfaces.BankAccountService;
import com.bank.services.interfaces.CurrencyTypeService;
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

    private final CurrencyTypeService currencyTypeService;

    private final PaymentServiceImpl paymentService;
    @Autowired
    public InvestmentController(InvestmentService investmentService,
                                BankAccountService bankAccountService,
                                CurrencyTypeService currencyTypeService,
                                PaymentServiceImpl paymentService) {
        this.investmentService = investmentService;
        this.bankAccountService = bankAccountService;
        this.currencyTypeService = currencyTypeService;
        this.paymentService = paymentService;
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
        return "user-deposits";
    }
    @PostMapping("close-deposit/{id}")
    @Secured("ROLE_USER")
    public String close(@PathVariable("id") Long id) {
        //investmentService.deleteDepositById(id);
        if(investmentService.findById(id).getInvestmentType().getInvestmentStatus().name().equals("ACTIVE"))
            investmentService.updateStatus(id);
        return "redirect:/investments/user-deposits";
    }
    @RequestMapping(value="/byId/{id}", method = RequestMethod.POST)
    @ResponseBody
    public InvestmentOut practicePagePost(@PathVariable("id") Long id){
        return investmentService.findById(id);
    }

    @GetMapping("/byId/{id}")
    @Secured({"ROLE_EMPLOYEE", "ROLE_USER"})
    public void findById(@PathVariable("id") Long id, Model model) {
        model.addAttribute("depositDetail", investmentService.findById(id));
    }

    @GetMapping("employee/deposits")
    @Secured("ROLE_EMPLOYEE")
    public String deposits(Model model) {
        model.addAttribute("depositForm", new PaymentIn());
        model.addAttribute("allAccount", bankAccountService.findAll());
        model.addAttribute("allCurrencyType", currencyTypeService.findAll());
        model.addAttribute("allDeposits", paymentService.findAll());

        return "deposits";
    }
    @PostMapping("employee/deposits")
    @Secured("ROLE_EMPLOYEE")
    public String createPayment(PaymentIn paymentIn) {
        paymentService.create(paymentIn);
        return "redirect:/investments/employee/deposits";
    }
    @RequestMapping(value="/employee/deposit/byId/{id}", method = RequestMethod.POST)
    @ResponseBody
    public PaymentOut findDepositById(@PathVariable("id") Long id){
        return paymentService.findAll().stream().filter(o->o.getId().equals(id)).findFirst().get();
    }
    @RequestMapping(value="/employee/account/byId/{id}", method = RequestMethod.POST)
    @ResponseBody
    public BankAccountOut findAccountById(@PathVariable("id") Long id){
        return bankAccountService.findById(id);
    }

//    @GetMapping("/byUser")
//    @Secured("USER")
//    public List<InvestmentOut> findAllByUser() {
//        return investmentService.findAllByUser();
//    }
//
//    @PatchMapping("/{id}")
//    @PreAuthorize("isAuthenticated()")
//    public InvestmentOut updateStatus(@PathVariable("id") Long id) {
//        return investmentService.updateStatus(id);
//    }
//
//
//
//    @Secured("EMPLOYEE")
//    @GetMapping("/byBankAccount/{id}")
//    public List<InvestmentOut> findAllActiveByBankAccountId(@PathVariable("id") Long id){
//        return investmentService.findActiveByBankAccountId(id);
//    }
}
