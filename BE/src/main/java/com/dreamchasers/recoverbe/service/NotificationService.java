package com.dreamchasers.recoverbe.service;

import com.dreamchasers.recoverbe.entity.CourseKit.Course;
import com.dreamchasers.recoverbe.entity.User.QNotification;
import com.dreamchasers.recoverbe.enums.ReferenceType;
import com.dreamchasers.recoverbe.helper.converters.ConvertService;
import com.dreamchasers.recoverbe.helper.component.ResponseObject;
import com.dreamchasers.recoverbe.entity.User.Notification;
import com.dreamchasers.recoverbe.entity.User.User;
import com.dreamchasers.recoverbe.enums.CoursePostStatus;
import com.dreamchasers.recoverbe.enums.NotificationType;
import com.dreamchasers.recoverbe.repository.NotificationRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.QueryFactory;
import com.querydsl.core.QueryResults;
import com.querydsl.core.Tuple;
import com.querydsl.jpa.impl.JPAQueryFactory;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
@Transactional
public class NotificationService {
    private final NotificationRepository notificationRepository;
    private final SimpMessagingTemplate simpMessagingTemplate;
    private final ConvertService convertService;

    public Notification save(Notification noti) {
        return notificationRepository.save(noti);
    }
//
//    public ResponseObject addFriend(String email) {
//        User recipient = userService.getChatByEmail(email);
//        var sender = userService.getCurrentUser();
//        if(Objects.equals(email, sender.getEmail())) {
//            return ResponseObject.builder().status(HttpStatus.BAD_REQUEST).message("Can't add yourself").build();
//        }
//        sendRequestAddFriend(sender, recipient);
//        return ResponseObject.builder().status(HttpStatus.NO_CONTENT).build();
//    }

    public void sendRequestAddFriend(User sender, User recipient) {
        var noti = Notification.builder()
                .title("Send you a request to add friend")
                .sender(sender)
                .content(sender.getFirstName() + " " + sender.getLastName() + " send you a request to add friend")
                .type(NotificationType.ADD_FRIEND)
                .recipient(recipient)
                .referenceType(ReferenceType.ADD_FRIEND)
                .build();
        save(noti);
        sendToUser(noti, recipient);
    }

    public void sendToPostAuthor(User sender, User postAuThor, ReferenceType referenceType, UUID commentId, String postTile) {
        if(Objects.equals(sender.getEmail(), postAuThor.getEmail())) return;
        var notification = Notification.builder()
                .recipient(postAuThor)
                .sender(sender)
                .commentId(commentId)
                .title(postTile)
                .postTitle(postTile)
                .referenceType(referenceType)
                .content("You have a new comment in your post")
                .type(NotificationType.NEW_COMMENT)
                .build();

        notification.setCreatedAt(LocalDateTime.now());
        notificationRepository.save(notification);
        sendToUser(notification, postAuThor);
    }

    public NotificationType getNotificationType(CoursePostStatus status, boolean isCourse) {
        return switch (status) {
            case APPROVED -> isCourse ? NotificationType.COURSE_APPROVED : NotificationType.POST_APPROVED;
            case REJECTED -> isCourse ? NotificationType.COURSE_REJECTED : NotificationType.POST_REJECTED;
            case PUBLISHED -> isCourse ? NotificationType.COURSE_PUBLISHED : NotificationType.POST_PUBLISHED;
            default -> isCourse ? NotificationType.COURSE_PENDING : NotificationType.POST_PENDING;
        };
    }

    public ResponseObject readNotification(UUID id) {
        var notification = notificationRepository.findById(id).orElse(null);
        if (notification == null) {
            return null;
        }
        notification.setRead(true);
        return ResponseObject.builder().content(convertService.convertToNotificationDTO(notification)).status(HttpStatus.OK).build();
    }



    public Notification saveNotification (Notification notification) {
        return notificationRepository.save(notification);
    }

    private void sendToUser(Notification notification, User recipient) {
        simpMessagingTemplate.convertAndSendToUser(recipient.getEmail(), "/notification", notification);
    }

    public void sendNotificationToUser(Notification notification) {
        var noti = saveNotification(notification);
        sendToUser(noti, notification.getRecipient());
    }

    public void adminSendUpdateStatusCourseToUser(Course course, User user, NotificationType type, CoursePostStatus status) {
        var notification = Notification.builder()
                .recipient(user)
                .title("Course status updated")
                .content("Your course " + course.getTitle() + " has been " + status.toString().toLowerCase())
                .type(type)
                .referenceType(ReferenceType.COURSE)
                .courseId(course.getId())
                .build();
        saveNotification(notification);
        sendToUser(notification, user);
    }

}
