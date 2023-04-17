package com.bank.repositories;

import com.bank.models.Message;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepository extends JpaRepository<Message, Long> {
    Page<Message> findAllByConversation_Id(Pageable pageable, Long id);
}
