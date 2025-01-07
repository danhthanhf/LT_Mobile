package com.dreamchasers.recoverbe.dto;

import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MessageDTO {
    private String type;
    private UUID chatId;
    private UUID id;
    private String content;
    private String fileUrl;
    private String fileType;
    private String fileName;
    private UserBasicDTO sender;
    private LocalDateTime createdAt;
}
