package com.bank.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.bank.models.enums.ConversationDirection;
import com.bank.models.enums.ConversationStatus;
import com.bank.models.user.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.Instant;
import java.util.Set;

@Entity
@Table(name="conversations")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Conversation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "creation_date")
    private Instant creationDate;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "topic")
    private String topic;

    @Column(name = "description")
    private String description;

    @ManyToOne
    @JoinColumn(name = "conversation_status_id")
    private ConversationStatus conversationStatus;

    @ManyToOne
    @JoinColumn(name = "conversation_direction_id")
    private ConversationDirection conversationDirection;

    @OneToMany(mappedBy = "conversation", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonIgnore
    private Set<Message> messages;
}
