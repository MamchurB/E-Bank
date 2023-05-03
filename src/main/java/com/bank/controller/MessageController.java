package com.bank.controller;

import com.bank.dto.in.MessageIn;
import com.bank.dto.out.MessageOut;
import com.bank.dto.out.UserOut;
import com.bank.services.interfaces.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/messages")
public class MessageController {
    private final MessageService messageService;

    @Autowired
    public MessageController(MessageService messageService) {
        this.messageService = messageService;
    }
    @GetMapping("/conversation/{id}")
    @PreAuthorize("isAuthenticated()")
    public Page<MessageOut> findByConversationId(Pageable pageable,
                                                 @PathVariable("id") Long id) {
        return messageService.findAllByConversationId(pageable, id);
    }

    @PostMapping
    @PreAuthorize("isAuthenticated()")
    public MessageOut create(@RequestBody @Valid MessageIn messageIn) {
        return messageService.create(messageIn);
    }
}
