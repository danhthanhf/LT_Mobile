package com.dreamchasers.recoverbe.controller.Public;

import com.dreamchasers.recoverbe.entity.CourseKit.Course;
import com.dreamchasers.recoverbe.entity.User.User;
import com.dreamchasers.recoverbe.enums.MethodPayment;
import com.dreamchasers.recoverbe.service.InvoiceService;
import com.dreamchasers.recoverbe.service.UserService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.UUID;

@Slf4j
@RestController
@RequestMapping("/api/v1/payment")
@RequiredArgsConstructor
public class PaymentController {
    private final UserService userService;
    private final InvoiceService invoiceService;

    @GetMapping("/process/{userId}/{courseId}")
    public void processPayment(
            @PathVariable UUID courseId,
            @PathVariable UUID userId,
            @RequestParam("vnp_Amount") String amount,
            @RequestParam("vnp_ResponseCode") String responseCode,
            @RequestParam("vnp_TransactionStatus") String transactionStatus,
            HttpServletResponse response) throws IOException {


        final String baseUrl = "http://localhost:3000/payment";
        User user = userService.findById(userId);
        String redirectUrl;

        if ("00".equals(transactionStatus)) {
            var result = userService.enrollCourse(user, courseId);
            invoiceService.saveForUser(user, (Course) result.getContent(), MethodPayment.VNPAY);

            if (result.getStatus() == HttpStatus.BAD_REQUEST) {
                redirectUrl = String.format("%s/failure?status=%s&email=%s&courseId=%s&content=%s",
                        baseUrl, transactionStatus, user.getEmail(), courseId, result.getContent());
            } else {
                redirectUrl = String.format("%s/success?status=%s&email=%s&courseId=%s",
                        baseUrl, transactionStatus, user.getEmail(), courseId);
            }
        } else {
            redirectUrl = String.format("%s/failure?status=%s&email=%s&courseId=%s",
                    baseUrl, transactionStatus, user.getEmail(), courseId);
        }

        response.sendRedirect(redirectUrl);
    }
}
