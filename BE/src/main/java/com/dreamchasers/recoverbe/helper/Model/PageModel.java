package com.dreamchasers.recoverbe.helper.Model;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class PageModel<T> {
    private List<T> content;
    private long totalElements;
    private int size;
    private int page;
    private int totalPages;
}
