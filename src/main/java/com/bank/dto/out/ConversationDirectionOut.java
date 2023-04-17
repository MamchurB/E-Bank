package com.bank.dto.out;

import com.bank.models.enums.ConversationDirection;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ConversationDirectionOut {
    private Long id;
    private ConversationDirection.ConversationDirectionType conversationDirectionType;
}
