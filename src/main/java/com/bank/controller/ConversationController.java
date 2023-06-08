package com.bank.controller;

import com.bank.dto.in.ConversationIn;
import com.bank.models.enums.ConversationDirection;
import com.bank.services.interfaces.ConversationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

}
