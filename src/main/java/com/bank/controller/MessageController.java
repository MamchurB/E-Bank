package com.bank.controller;

import com.bank.dto.in.MessageIn;
import com.bank.dto.out.MessageOut;
import com.bank.dto.out.UserOut;
import com.bank.services.interfaces.ConversationService;
import com.bank.services.interfaces.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/messages")
public class MessageController {
    private final MessageService messageService;
    private final ConversationService conversationService ;

    @Autowired
    public MessageController(MessageService messageService,
                             ConversationService conversationService) {
        this.messageService = messageService;
        this.conversationService = conversationService;
    }
    @GetMapping("/conversation/{id}/{pageNum}")
    @PreAuthorize("isAuthenticated()")
    public String findByConversationId(@PathVariable(name = "pageNum") int pageNum,
                                       @PathVariable("id") Long id,
                                       Model model) {
        Page<MessageOut> messages = messageService.findAllByConversationId(pageNum, id);
        List<MessageOut> listMessages = messages.getContent();

        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", messages.getTotalPages());
        model.addAttribute("totalItems", messages.getTotalElements());
        model.addAttribute("listMessages", listMessages);


        model.addAttribute("conversation", conversationService.findById(id));
        model.addAttribute("messageForm", new MessageIn());
        return "message-details";
    }

    @PostMapping("/conversation/{id}/{pageNum}")
    @PreAuthorize("isAuthenticated()")
    public String createMessage(@PathVariable(name = "pageNum") int pageNum,
                                @PathVariable("id") Long id,
                                MessageIn messageIn) {
        messageIn.setConversationId(id);
        messageService.create(messageIn);
        return "redirect:/messages/conversation/" + id + "/" + pageNum;
    }

    @PostMapping
    @PreAuthorize("isAuthenticated()")
    public MessageOut create(@RequestBody @Valid MessageIn messageIn) {
        return messageService.create(messageIn);
    }
}
