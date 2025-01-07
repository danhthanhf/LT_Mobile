package com.dreamchasers.recoverbe.service;

import com.dreamchasers.recoverbe.dto.ChatDTO;
import com.dreamchasers.recoverbe.dto.MessageDTO;
import com.dreamchasers.recoverbe.entity.User.User;
import com.dreamchasers.recoverbe.entity.chat.*;
import com.dreamchasers.recoverbe.exception.EntityNotFoundException;
import com.dreamchasers.recoverbe.helper.component.ResponseObject;
import com.dreamchasers.recoverbe.helper.converters.ConvertService;
import com.dreamchasers.recoverbe.repository.ChatRepository;
import com.dreamchasers.recoverbe.repository.MessageRepository;
import com.dreamchasers.recoverbe.repository.UserChatRepository;
import com.dreamchasers.recoverbe.repository.UserRepository;
import com.querydsl.jpa.impl.JPAQueryFactory;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
@Transactional
public class ChatService {
    private final ChatRepository chatRepository;
    private final MessageRepository messageRepository;
    private final UserRepository userRepository;
    private final UserChatRepository userChatRepository;
    private final UserService userService;
    private final SimpMessagingTemplate simpMessagingTemplate;
    private final ConvertService convertService;
    private final JPAQueryFactory queryFactory;

    public ResponseObject deleteById(UUID id) {
        var user = userService.getCurrentUser();
        var userChat = userChatRepository.findByChatIdAndUserId(id, user.getId()).orElseThrow(() -> new EntityNotFoundException("UserChat not found"));
        userChat.setDeleted(true);
        userChatRepository.save(userChat);
        return ResponseObject.builder().status(HttpStatus.NO_CONTENT).build();
    }

    public ResponseObject toggleBlockChat(UUID chatId, boolean block) {
        var user = userService.getCurrentUser();
        var chat = chatRepository.findById(chatId).orElseThrow(() -> new EntityNotFoundException("Chat not found"));
        var otherUser = chat.getParticipants().stream().filter(userChat -> !userChat.getUser().getId().equals(user.getId())).findFirst().orElseThrow(() -> new EntityNotFoundException("UserChat not found"));
        var userChat = userChatRepository.findByChatIdAndUserId(chatId, user.getId()).orElseThrow(() -> new EntityNotFoundException("UserChat not found"));
        userChat.setBlocked(block);
        userChatRepository.save(userChat);
        return ResponseObject.builder().status(HttpStatus.OK).content(getChatByEmail(otherUser.getUser().getEmail())).build();
    }

    private String determineFileType(String contentType) {
        if (contentType.startsWith("image")) return "image";
        if (contentType.startsWith("video")) return "video";
        if (contentType.contains("pdf")) return "document";
        if (contentType.contains("zip") || contentType.contains("x-zip-compressed")) return "zip";
        return "unknown";
    }

    public ResponseObject sendFile(UUID chatId, MultipartFile file) {
        var url = (String) userService.upload(file).getContent();
        String originalFilename = file.getOriginalFilename();
        MessageDTO message = MessageDTO.builder()
                .chatId(chatId)
                .sender(convertService.convertToUserBasicDTO(userService.getCurrentUser()))
                .fileUrl(url)
                .fileType(determineFileType(file.getContentType()))
                .fileName(originalFilename)
                .build();
        String contentType = file.getContentType();
        System.out.println(contentType);

        saveMessage(userService.getCurrentUser().getEmail(), message);
        simpMessagingTemplate.convertAndSend("/user/" + userService.getCurrentUser().getEmail() + "/chats", message);
        return ResponseObject.builder().status(HttpStatus.OK).content(message).build();
    }

    public ResponseObject readChat(UUID chatId) {
        var chat = chatRepository.findById(chatId).orElseThrow(() -> new EntityNotFoundException("Chat not found"));

        List<UserChat> userChatsToUpdate = new ArrayList<>();
        for (UserChat userChat : chat.getParticipants()) {
            if (userChat.getUser().equals(userService.getCurrentUser())) {
                userChat.setRead(true);
                userChatsToUpdate.add(userChat);
            }
        }
        userChatRepository.saveAll(userChatsToUpdate);

        return ResponseObject.builder().status(HttpStatus.OK).content(convertService.convertToChatDTO(chat, userService.getCurrentUser())).build();
    }

    private UserChat createUserChat(User user) {
        return new UserChat(user, false);
    }

    private void updateStatusChatForParticipant(Chat chat, User sender) {
        List<UserChat> userChatsToUnRead = new ArrayList<>();
        List<UserChat> userChatsToRead = new ArrayList<>();
        for (UserChat userChat : chat.getParticipants()) {
            if (!userChat.getUser().getId().equals(sender.getId())) {
                userChatsToUnRead.add(userChat);
            } else {
                userChatsToRead.add(userChat);
            }
        }
        for (UserChat userChat : userChatsToUnRead) {
            userChat.setRead(false);
            userChatRepository.save(userChat);
        }

        for (UserChat userChat : userChatsToRead) {
            userChat.setRead(true);
            userChatRepository.save(userChat);
        }
    }

    private Chat createChat(User user1, User user2) {
        var userChat1 = createUserChat(user1);
        var userChat2 = createUserChat(user2);
        userChatRepository.save(userChat1);
        userChatRepository.save(userChat2);

        var chat = Chat.builder().participants(List.of(userChat1, userChat2)).build();
        userChat1.setChat(chat);
        userChat2.setChat(chat);
        return chat;
    }

    private boolean isOtherUserBlocked(Chat chat, User currentUser) {
        for (UserChat userChat : chat.getParticipants()) {
            if (!userChat.getUser().getId().equals(currentUser.getId())) {
                return userChat.isBlocked();
            }
        }
        return false;
    }

    public MessageDTO saveMessage(String email, MessageDTO message) {
        var userEmail = message.getSender().getEmail();
        var sender = userRepository.findByEmail(userEmail).orElseThrow(() -> new EntityNotFoundException("User not found"));

        var recipient = userService.findByEmail(email);

        Chat chat = null;

        if(message.getChatId() != null) {
            chat = chatRepository.findById(message.getChatId()).orElseThrow(() -> new EntityNotFoundException("Chat not found"));
            if(isOtherUserBlocked(chat, sender)) {
                return MessageDTO.builder().type("WAS_BLOCKED").build();
            }
        }
        else {
            chat = createChat(sender, recipient);
        }


        chat.setLastMessageTime(LocalDateTime.now());
        // set recipient as unread
        updateStatusChatForParticipant(chat, sender);

        Message newMessage = createMessage(message, sender, chat);

        chat = chatRepository.save(chat);

        messageRepository.save(newMessage);

        message.setSender(convertService.convertToUserBasicDTO(sender));
        message.setCreatedAt(LocalDateTime.now());
        message.setChatId(chat.getId());
        return message;
    }

    public ResponseObject getRecentChats(int page, int size) {
        User currentUser = userService.getCurrentUser();
        QChat chat = QChat.chat;
        QUserChat userChat = QUserChat.userChat;

        var res = queryFactory.selectFrom(chat)
                .leftJoin(chat.participants, userChat)
                .where(
                       userChat.user.email.eq(currentUser.getEmail())
                               .and(userChat.deleted.isFalse())
                )
                .orderBy(chat.lastMessageTime.desc())
                .offset((long) page * size)
                .limit(size)
                .fetch();

        List<ChatDTO> result = res.stream().map(c -> convertService.convertToChatDTO(c, currentUser)).toList();

        return ResponseObject.builder().content(result).status(HttpStatus.OK).build();
    }

    public Message createMessage(MessageDTO message, User sender, Chat chat) {
        return Message.builder()
                .content(message.getContent())
                .sender(sender)
                .fileName(message.getFileName())
                .fileType(message.getFileType())
                .fileUrl(message.getFileUrl())
                .chat(chat).build();
    }

    public Page<MessageDTO> getMessageInChat(UUID chatId, int page, int size) {
        var pageRequest = PageRequest.of(page, size, Sort.by(Sort.Order.desc("createdAt")));
        var temp = messageRepository.findByChatId(chatId, pageRequest);

        // Create a modifiable list
        List<MessageDTO> messageDTOs = new ArrayList<>(temp.map(convertService::convertToMessageDTO).getContent());
        Collections.reverse(messageDTOs);

        return new PageImpl<>(messageDTOs, pageRequest, temp.getTotalElements());
    }

    public ResponseObject getChatByEmail(String email) {
        User user1 = userService.getCurrentUser();
        User user2 = userService.findByEmail(email);

        var chat = queryFactory.selectFrom(QChat.chat).where(
                QChat.chat.participants.any().user.email.eq(user2.getEmail())
                        .and(QChat.chat.participants.any().user.email.eq(user2.getEmail()))
        ).fetchFirst();
        UserChat current = queryFactory.selectFrom(QUserChat.userChat)
                .where(QUserChat.userChat.user.email.eq(user1.getEmail())
                        .and(QUserChat.userChat.chat.id.eq(chat.getId())))
                .fetchFirst();

        UserChat other = queryFactory.selectFrom(QUserChat.userChat)
                .where(QUserChat.userChat.user.email.eq(user2.getEmail())
                        .and(QUserChat.userChat.chat.id.eq(chat.getId())))
                .fetchFirst();

        ChatDTO chatDTO = null;
        if(chat != null) {
            Page messages = getMessageInChat(chat.getId(), 0, 10);
            chatDTO = ChatDTO.builder().messages(messages).id(chat.getId())
                    .currentUserBlocked(current.isBlocked())
                    .otherUserBlocked(other.isBlocked())
                    .build();
        }

        return ResponseObject.builder().content(chatDTO).status(HttpStatus.OK).build();
    }

}
