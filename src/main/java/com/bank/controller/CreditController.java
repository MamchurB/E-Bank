package com.bank.controller;

import com.bank.dto.in.CreditIn;
import com.bank.dto.out.CreditOut;
import com.bank.dto.out.CreditStatusOut;
import com.bank.models.enums.CreditStatus;
import com.bank.repositories.BankAccountRepository;
import com.bank.repositories.SaldoRepository;
import com.bank.services.CurrencyTypeServiceImpl;
import com.bank.services.interfaces.BankAccountService;
import com.bank.services.interfaces.CreditService;
import com.bank.services.interfaces.CurrencyTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
@Controller
@RequestMapping("/credits")
public class CreditController {
    private final CreditService creditService;

    private final CurrencyTypeServiceImpl currencyTypeService;

    private final BankAccountService bankAccountService;
    @Autowired
    public CreditController(CreditService creditService,
                            CurrencyTypeServiceImpl currencyTypeService,
                            BankAccountService bankAccountService) {
        this.creditService = creditService;
        this.currencyTypeService = currencyTypeService;
        this.bankAccountService = bankAccountService;
    }

    @GetMapping
    @Secured("ROLE_USER")
    public String credits(Model model) {
        model.addAttribute("creditsForm", new CreditIn());
        model.addAttribute("allCurrencyType", currencyTypeService.findAll());
        model.addAttribute("allAccount", bankAccountService.findByUser());
        System.out.println("credit");

        return "credit";
    }
    @PostMapping
    @Secured("ROLE_USER")
    public String create(CreditIn creditIn) {
        creditService.create(creditIn);
        return "redirect:/credits/user-credits";
    }

    @GetMapping("user-credits")
    @Secured("ROLE_USER")
    public String userCredits(Model model) {
        model.addAttribute("allUserCredits", creditService.findByUser());
        return "user-credits";
    }


    @RequestMapping(value="/byId/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CreditOut practicePagePost(@PathVariable("id") Long id){
        return creditService.findById(id);
    }

    @GetMapping("/byId/{id}")
    @Secured({"ROLE_EMPLOYEE", "ROLE_USER"})
    public void findById(@PathVariable("id") Long id, Model model) {
        model.addAttribute("creditDetail",creditService.findById(id));
    }

    @GetMapping("/employee/credits")
    @Secured("ROLE_EMPLOYEE")
    public String creditsEmployee(Model model) {
        model.addAttribute("allCredits", creditService.findByCreditType(CreditStatus.CreditType.AWAITING));
        model.addAttribute("allStatuses", creditService.findAllCreditStatuses());

        return "credits";
    }

    @GetMapping("/employee/credits/{id}/active")
    @Secured("ROLE_EMPLOYEE")
    public String changeStatusActive(@PathVariable Long id) {
        creditService.changeStatus(id, CreditStatus.CreditType.ACTIVE);
        return "redirect:/credits/employee/credits";
    }
    @GetMapping("/employee/credits/{id}/cancel")
    @Secured("ROLE_EMPLOYEE")
    public String changeStatusCancel(@PathVariable Long id) {
        creditService.changeStatus(id, CreditStatus.CreditType.CANCELED);
        return "redirect:/credits/employee/credits";
    }

    @Secured("ROLE_ADMIN")
    @GetMapping("/statuses")
    public List<CreditStatusOut> findAllCreditStatuses() {
        return creditService.findAllCreditStatuses();
    }

    @Secured("ROLE_ADMIN")
    @GetMapping("/count")
    public Long countByCreditType(@RequestParam("type") CreditStatus.CreditType creditType) {
        return creditService.countAllByCreditType(creditType);
    }

    @Secured("ROLE_EMPLOYEE")
    @GetMapping("/byBankAccount/{id}")
    public List<CreditOut> findAllActiveByBankAccountId(@PathVariable("id") Long id) {
        return creditService.findActiveByBankAccountId(id);
    }

}
