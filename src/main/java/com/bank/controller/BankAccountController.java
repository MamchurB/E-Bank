package com.bank.controller;

import com.bank.dto.edit.*;
import com.bank.dto.in.BankAccountIn;
import com.bank.dto.in.EmployeeIn;
import com.bank.dto.in.UserIn;
import com.bank.dto.out.*;
import com.bank.models.enums.BankAccountType;
import com.bank.models.user.UserRole;
import com.bank.services.CreditServiceImpl;
import com.bank.services.CurrencyTypeServiceImpl;
import com.bank.services.UserServiceImpl;
import com.bank.services.interfaces.BankAccTypeService;
import com.bank.services.interfaces.BankAccountService;
import com.bank.services.interfaces.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


@Controller
@RequestMapping
public class BankAccountController {
    private final BankAccountService bankAccountService;
    private final UserServiceImpl userService;
    private final TransactionService transactionService;

    private final BankAccTypeService bankAccTypeService;

    private final CurrencyTypeServiceImpl currencyTypeService;

    private final CreditServiceImpl creditService;

    @Autowired
    public BankAccountController(BankAccountService bankAccountService,
                                 UserServiceImpl userService,
                                 TransactionService transactionService,
                                 BankAccTypeService bankAccTypeService,
                                 CurrencyTypeServiceImpl currencyTypeService,
                                 CreditServiceImpl creditService) {
        this.bankAccountService = bankAccountService;
        this.userService = userService;
        this.transactionService = transactionService;
        this.bankAccTypeService = bankAccTypeService;
        this.currencyTypeService = currencyTypeService;
        this.creditService = creditService;
    }
    @GetMapping
    @Secured("ROLE_USER")
    public String account(Model model) {
        String user =  SecurityContextHolder.getContext().getAuthentication().getName();
        UserOut userOut = userService.findByIdentifier(user);
        model.addAttribute("name", userOut.getAddress().getName() + " " + userOut.getAddress().getSurname());
        model.addAttribute("allBankAccount", bankAccountService.findByUser());
        model.addAttribute("allTypeAccount", bankAccTypeService.findAll());
        model.addAttribute("bankAccForm", new BankAccountIn());
       return "index";
    }
    @GetMapping("/card-details/{id}")
    @Secured("ROLE_USER")
    public String cardDetails(Model model, @PathVariable("id") Long id){
        model.addAttribute("bankAccount", bankAccountService.findById(id));
        model.addAttribute("transactionsById", transactionService.findAllByBankAccountId(id));
        model.addAttribute("bankAccountId", id);
        model.addAttribute("chartData", transactionService.groupTransactionByTransactionType(id));
        System.out.println(transactionService.groupTransactionByTransactionType(id).toString());
        return "card-details";
    }

    @GetMapping("/close-account/{id}")
    @Secured("ROLE_USER")
    public String cardClose(@PathVariable("id") Long id) {
        bankAccountService.deleteById(id);
        return "redirect:/";
    }

    @PostMapping
    @Secured("ROLE_USER")
    public String create(BankAccountIn bankAccountIn) {
        bankAccountService.create(bankAccountIn, SecurityContextHolder.getContext().getAuthentication().getName());
        return "redirect:/";
    }
    @GetMapping("/admin/statistic")
    @Secured("ROLE_ADMIN")
    public String statistic(Model model){
        model.addAttribute("allCurrencyType", currencyTypeService.findAll());
        model.addAttribute("allBankTypeAccount", bankAccTypeService.findAll());
        model.addAttribute("chartData", creditService.groupCreditByStatus());
        model.addAttribute("bankAccTypeEdit", new BankAccTypeEdit());
        model.addAttribute("currencyTypeEdit", new CurrencyTypeEdit());

        return "statistic";
    }
    @GetMapping("/admin/employee")
    @Secured("ROLE_ADMIN")
    public String employee(Model model){
        model.addAttribute("allEmployee", userService.findAllByUserType(UserRole.UserType.ROLE_EMPLOYEE));
        model.addAttribute("editUser", new UserEdit());
        model.addAttribute("employeeForm", new EmployeeIn());
        return "employees";
    }
    @PostMapping("/admin/employee")
    public String users(UserEdit userEdit){
        userService.update(userEdit.getId(), userEdit);
        return "redirect:/admin/employee";
    }
    @PostMapping("/admin/createEmployee")
    public String createEmployee(EmployeeIn employeeIn){
        userService.createEmployee(employeeIn);
        return "redirect:/admin/employee";
    }




    @RequestMapping(value="/accountEdit/byId/{id}", method = RequestMethod.POST)
    @ResponseBody
    public BankAccTypeOut findAccountById(@PathVariable("id") Long id){
        return bankAccTypeService.findById(id);
    }
    @RequestMapping(value="/currentEdit/byId/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CurrencyTypeOut findCurrentById(@PathVariable("id") Long id){
        return currencyTypeService.findById(id);
    }
    @PostMapping("/update/account")
    @Secured("ROLE_ADMIN")
    public String updateAccount(BankAccTypeEdit bankAccTypeEdit) {
       bankAccTypeService.update(bankAccTypeEdit.getId(), bankAccTypeEdit);
        return "redirect:/admin/statistic";
    }

    @PostMapping("/update/current")
    @Secured("ROLE_ADMIN")
    public String updateAccount(CurrencyTypeEdit currencyTypeEdit) {
        currencyTypeService.update(currencyTypeEdit.getIdCurrency(),currencyTypeEdit);
        return "redirect:/admin/statistic";
    }
    @PutMapping("/{id}")
    @Secured("ROLE_ADMIN")
    public BankAccTypeOut update(@PathVariable Long id,
                                 @RequestBody @Valid BankAccTypeEdit bankAccTypeEdit) {
        return bankAccTypeService.update(id, bankAccTypeEdit);
    }
//    @GetMapping
//    @Secured("EMPLOYEE")
//    public List<BankAccountOut> findAll() {
//        return bankAccountService.findAll();
//    }
//
//
//
//    @PostMapping
//    @Secured("USER")
//    public BankAccountOut create(@RequestBody BankAccountIn bankAccountIn,
//                                 @AuthenticationPrincipal String username) {
//        return bankAccountService.create(bankAccountIn, username);
//    }

//    @GetMapping("/{id}")
//    @PreAuthorize("isAuthenticated()")
//    public BankAccountOut findById(@PathVariable("id") Long id) {
//        return bankAccountService.findById(id);
//    }
//
//    @GetMapping("/{id}/accountCount")
//    @Secured("ROLE_ADMIN")
//    public Long getBankAccountCountByType(@PathVariable("id") Long id) {
//        return bankAccountService.findBankAccountCountByType(id);
//    }
//
//    @Secured({"ROLE_USER", "ROLE_EMPLOYEE"})
//    @DeleteMapping("/{id}")
//    @ResponseStatus(HttpStatus.NO_CONTENT)
//    public void deleteById(@PathVariable("id") Long id) {
//        bankAccountService.deleteById(id);
//    }
//
//    @Secured("ROLE_EMPLOYEE")
//    @PutMapping("/{id}")
//    public BankAccountOut update(@PathVariable("id") Long id,
//                                 @RequestBody @Valid BankAccountEdit bankAccountEdit) {
//        return bankAccountService.update(id, bankAccountEdit);
//    }
//
//    @Secured("ROLE_EMPLOYEE")
//    @PutMapping("/saldo/{id}")
//    public SaldoOut update(@PathVariable("id") Long id,
//                           @RequestBody @Valid SaldoEdit saldoEdit) {
//        return bankAccountService.updateSaldo(id, saldoEdit);
//    }

}
