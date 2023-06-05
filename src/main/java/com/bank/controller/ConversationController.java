package com.bank.controller;

import com.bank.dto.in.ConversationIn;
import com.bank.dto.in.MessageIn;
import com.bank.dto.out.ConversationOut;
import com.bank.models.enums.ConversationDirection;
import com.bank.services.interfaces.ConversationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/conversations")
public class ConversationController {
    private final ConversationService conversationService;

    @Autowired
    public ConversationController(ConversationService conversationService) {
        this.conversationService = conversationService;
    }

    @GetMapping
    @Secured("ROLE_USER")
    public String conversation(Model model) {
        model.addAttribute("allConversation", conversationService.findByCurrentUser());
        model.addAttribute("convertationForm", new ConversationIn());
        return "message";
    }
    @PostMapping
    @Secured("ROLE_USER")
    public String createConversation(ConversationIn conversationIn) {
        conversationIn.setConversationDirectionType(ConversationDirection.ConversationDirectionType.USER_TO_EMPLOYEE);
        conversationService.create(conversationIn);
        return "redirect:/conversations";
    }

    @GetMapping("/userToEmployee")
    @Secured("ROLE_EMPLOYEE")
    public String findAllUserToEmployee(Model model) {
       model.addAttribute("allConversation", conversationService.findByConversationDirection(ConversationDirection.ConversationDirectionType.USER_TO_EMPLOYEE));
       model.addAttribute("convertationForm", new ConversationIn());
        return "message";
    }

    @PostMapping("/userToEmployee")
    @Secured("ROLE_EMPLOYEE")
    public String createConversationToAdmin(ConversationIn conversationIn) {
        conversationIn.setConversationDirectionType(ConversationDirection.ConversationDirectionType.EMPLOYEE_TO_ADMIN);
        conversationService.create(conversationIn);
        return "redirect:/conversations/userToEmployee";
    }

    @GetMapping("/admin/employeeToAdmin")
    @Secured("ROLE_ADMIN")
    public String findAllEmployeeToAdmin(Model model) {
        model.addAttribute("allConversation", conversationService.findByConversationDirection(ConversationDirection.ConversationDirectionType.EMPLOYEE_TO_ADMIN));
        model.addAttribute("convertationForm", new ConversationIn());
        return "message";
    }
    @PostMapping("/admin/employeeToAdmin")
    @Secured("ROLE_EMPLOYEE")
    public String createConversationEmployeeToAdmin(ConversationIn conversationIn) {
        conversationIn.setConversationDirectionType(ConversationDirection.ConversationDirectionType.EMPLOYEE_TO_ADMIN);
        conversationService.create(conversationIn);
        return "redirect:/conversations/employeeToAdmin";
    }

//    @GetMapping
//    @Secured("ADMIN")
//    public List<ConversationOut> findAll() {
//        return conversationService.findAll();
//    }

//    @GetMapping("/employeeToAdmin")
//    @Secured({"ROLE_ADMIN", "ROLE_EMPLOYEE"})
//    public List<ConversationOut> findAllEmployeeAdminDirection() {
//        return conversationService.findByConversationDirection(ConversationDirection.ConversationDirectionType.EMPLOYEE_TO_ADMIN);
//    }

//    @GetMapping("/userToEmployee")
//    @Secured({"USER", "EMPLOYEE"})
//    public List<ConversationOut> findAllUserToEmployeeDirection() {
//        return conversationService.findByConversationDirection(ConversationDirection.ConversationDirectionType.USER_TO_EMPLOYEE);
//    }

//    @GetMapping("/my")
//    @PreAuthorize("isAuthenticated()")
//    public List<ConversationOut> findByCurrentUser() {
//        return conversationService.findByCurrentUser();
//    }

//    @PostMapping
//    @PreAuthorize("isAuthenticated()")
//    public ConversationOut create(@RequestBody ConversationIn conversationIn) {
//        return conversationService.create(conversationIn);
//    }

//    @GetMapping("/id/{id}")
//    @PreAuthorize("isAuthenticated()")
//    public ConversationOut findById(@PathVariable("id") Long id) {
//        return conversationService.findById(id);
//    }
//
//    @PatchMapping("/{id}")
//    @Secured({"ROLE_ADMIN", "ROLE_EMPLOYEE"})
//    public ConversationOut changeStatus(@PathVariable("id") Long id) {
//        return conversationService.changeStatus(id);
//    }
}
