package com.bank.controller;

import com.bank.dto.in.CreditIn;
import com.bank.dto.out.CreditOut;
import com.bank.dto.out.CreditStatusOut;
import com.bank.models.enums.CreditStatus;
import com.bank.repositories.SaldoRepository;
import com.bank.services.interfaces.CreditService;
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

    private final SaldoRepository saldoRepository;
    @Autowired
    public CreditController(CreditService creditService,
                            SaldoRepository saldoRepository) {
        this.creditService = creditService;
        this.saldoRepository = saldoRepository;
    }

    @GetMapping
    @Secured("ROLE_USER")
    public String credits(Model model) {
        model.addAttribute("creditsForm", new CreditIn());
        model.addAttribute("allSaldo", saldoRepository.findAll());
        System.out.println("credit");

        return "credit";
    }
    @PostMapping
    @Secured("ROLE_USER")
    public String create(CreditIn creditIn) {
        System.out.println("create credit");
        creditService.create(creditIn);
        System.out.println("finish credit");
        return "login";
    }



    @GetMapping("/byType")
    @Secured("ROLE_EMPLOYEE")
    public List<CreditOut> findAllByCreditType(@RequestParam("creditType") CreditStatus.CreditType creditType) {
        return creditService.findByCreditType(creditType);
    }

    @GetMapping("/byId/{id}")
    @Secured({"ROLE_EMPLOYEE", "ROLE_USER"})
    public CreditOut findById(@PathVariable("id") Long id) {
        return creditService.findById(id);
    }

    @PatchMapping("/{id}/status")
    @Secured("ROLE_EMPLOYEE")
    public CreditOut changeStatus(@PathVariable Long id,
                                  @RequestParam("status") Optional<CreditStatus.CreditType> status) {
        if (status.isPresent()) {
            return creditService.changeStatus(id, status.get());
        } else {
            return creditService.changeStatus(id);
        }
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