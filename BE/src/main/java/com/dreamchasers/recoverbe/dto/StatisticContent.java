package com.dreamchasers.recoverbe.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Builder
@Setter
public  class StatisticContent {
    private UserBasicDTO user;
    private CourseDTO course;
    private int revenue;
    private LocalDateTime createdAt;
}