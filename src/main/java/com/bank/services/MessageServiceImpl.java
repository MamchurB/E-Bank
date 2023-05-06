package com.bank.services;

import com.bank.dto.in.MessageIn;
import com.bank.dto.out.MessageOut;
import com.bank.mappers.MessageMapper;
import com.bank.models.Message;
import com.bank.repositories.ConversationRepository;
import com.bank.repositories.MessageRepository;
import com.bank.repositories.UserRepository;
import com.bank.services.interfaces.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;
import java.time.Instant;

@Service
public class MessageServiceImpl implements MessageService {
    private final MessageRepository messageRepository;

    private final MessageMapper messageMapper;

    private final ConversationRepository conversationRepository;

    private final UserRepository userRepository;

    @Autowired
    public MessageServiceImpl(MessageRepository messageRepository,
                              MessageMapper messageMapper,
                              ConversationRepository conversationRepository, UserRepository userRepository) {
        this.messageRepository = messageRepository;
        this.messageMapper = messageMapper;
        this.conversationRepository = conversationRepository;
        this.userRepository = userRepository;
    }

    @Override
    public MessageOut create(@NotNull MessageIn messageIn) {
        Message mapped = messageMapper.DTOtoEntity(messageIn);
        mapped.setId(null);
        mapped.setUser(userRepository.findByIdentifier(
            SecurityContextHolder.getContext()
                .getAuthentication()
                .getName())
            .orElseThrow(() -> new RuntimeException("Not found")));
        mapped.setDate(Instant.now());
        mapped.setConversation(conversationRepository.findById(messageIn.getConversationId())
            .orElseThrow(() -> new RuntimeException("Not found")));
        return messageMapper.entityToDTO(messageRepository.saveAndFlush(mapped));
    }

    @Override
    public Page<MessageOut> findAllByConversationId(int pageNum, Long conversationId) {
        int pageSize = 5;
        Sort sort = Sort.by("date").descending();
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize, sort);
        return messageRepository.findAllByConversation_Id(pageable, conversationId)
            .map(messageMapper::entityToDTO);
    }


}
