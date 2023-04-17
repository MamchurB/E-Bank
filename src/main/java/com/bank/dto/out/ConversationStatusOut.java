package com.bank.dto.out;

import com.bank.models.enums.ConversationStatus;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ConversationStatusOut {
    private Long id;
    private ConversationStatus.ConversationType conversationType;
}
