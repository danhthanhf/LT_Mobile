package com.dreamchasers.recoverbe.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class InstructorStatistic {
    private int totalAmountInvoice;
    private int totalAmountInvoiceInMonth;
    private int totalAmountEnrollment;
    private int totalEnrollmentInMonth;
}
