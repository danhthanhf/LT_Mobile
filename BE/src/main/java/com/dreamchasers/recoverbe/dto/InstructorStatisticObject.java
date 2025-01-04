package com.dreamchasers.recoverbe.dto;

import com.dreamchasers.recoverbe.helper.Model.PageModel;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Data
@Builder
public class InstructorStatisticObject {
    private List<StatisticContent> content;
}

