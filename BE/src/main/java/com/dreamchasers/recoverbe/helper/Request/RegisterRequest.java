package com.dreamchasers.recoverbe.helper.Request;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class RegisterRequest {
    private String email;
    private String password;
    private String firstName;
    private String lastName;
}
