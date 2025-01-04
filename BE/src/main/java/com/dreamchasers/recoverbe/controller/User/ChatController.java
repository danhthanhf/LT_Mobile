package com.dreamchasers.recoverbe.controller.User;

import com.dreamchasers.recoverbe.helper.component.ResponseObject;
import com.dreamchasers.recoverbe.service.ChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/chats")
@RequiredArgsConstructor
public class ChatController {
    private final ChatService chatService;

    @GetMapping("/recent")
    public ResponseEntity<ResponseObject> getRecentChats(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size) {
        var res = chatService.getRecentChats(page, size);
        return ResponseEntity.status(res.getStatus()).body(res);
    }

    @GetMapping("/{email}")
    public ResponseEntity<ResponseObject> getChatByEmail(@PathVariable String email) {
        var res = chatService.getChatByEmail(email);
        return ResponseEntity.status(res.getStatus()).body(res);
    }

    @PostMapping("/{chatId}/send-file")
    public ResponseEntity<ResponseObject> sendFile(@PathVariable UUID chatId, @RequestPart("file") MultipartFile file) {
        var res = chatService.sendFile(chatId, file);
        return ResponseEntity.status(res.getStatus()).body(res);
    }

    @PutMapping("/{chatId}/read")
    public ResponseEntity<ResponseObject> readChat(@PathVariable UUID chatId) {
        var res = chatService.readChat(chatId);
        return ResponseEntity.status(res.getStatus()).body(res);
    }

    @PutMapping("/{chatId}/block")
    public ResponseEntity<ResponseObject> blockChat(@PathVariable UUID chatId) {
        var res = chatService.toggleBlockChat(chatId, true);
        return ResponseEntity.status(res.getStatus()).body(res);
    }

    @PutMapping("/{chatId}/unblock")
    public ResponseEntity<ResponseObject> unBlockChat(@PathVariable UUID chatId) {
        var res = chatService.toggleBlockChat(chatId, false);
        return ResponseEntity.status(res.getStatus()).body(res);
    }

    @DeleteMapping("/{chatId}")
    public ResponseEntity<ResponseObject> deleteChat(@PathVariable UUID chatId) {
        var res = chatService.deleteById(chatId);
        return ResponseEntity.status(res.getStatus()).body(res);
    }

}
