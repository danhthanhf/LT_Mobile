package com.dreamchasers.recoverbe.service;

import com.dreamchasers.recoverbe.entity.CourseKit.Course;
import com.dreamchasers.recoverbe.entity.User.Invoice;
import com.dreamchasers.recoverbe.entity.User.QInvoice;
import com.dreamchasers.recoverbe.entity.User.User;
import com.dreamchasers.recoverbe.enums.MethodPayment;
import com.dreamchasers.recoverbe.exception.EntityNotFoundException;
import com.dreamchasers.recoverbe.helper.Model.PageModel;
import com.dreamchasers.recoverbe.helper.component.ResponseObject;
import com.dreamchasers.recoverbe.repository.InvoiceRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.QueryFactory;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class InvoiceService {
    private final InvoiceRepository invoiceRepository;
    private final UserService userService;
    private final JPAQueryFactory queryFactory;

    public ResponseObject searchByEmail(String email, boolean isAdmin, int page, int size, boolean isDelete) {
        QInvoice invoice = QInvoice.invoice;
        BooleanBuilder builder = new BooleanBuilder();

        builder.and(invoice.deleted.eq(isDelete));

        if(!isAdmin) {
            // instructor search invoice by email
            builder.and(invoice.course.author.email.eq(email));
        }

        boolean b = !email.trim().equalsIgnoreCase("");
        if (b) {
            builder.and(invoice.user.email.containsIgnoreCase(email));
        }

        List<Invoice> listInvoice = queryFactory.selectFrom(invoice)
                .where(builder)
                .offset((long) page * size)
                .limit(size)
                .fetch();

        int total = Objects.requireNonNull(queryFactory.select(invoice.count())
                .from(invoice)
                .where(builder)
                .fetchOne()).intValue();

        PageModel<Invoice> pageModel = PageModel.<Invoice>builder()
                .content(listInvoice)
                .totalElements(total)
                .page(page)
                .totalPages((int) Math.ceil((double) listInvoice.size() / size))
                .size(size)
                .build();
        return ResponseObject.builder().status(HttpStatus.OK).content(pageModel).build();
    }

    public ResponseObject getInvoices(int page, int size, boolean isDelete, boolean isAdmin) {
        QInvoice invoice = QInvoice.invoice;
        var user = userService.getCurrentUser();

        BooleanBuilder builder = new BooleanBuilder();
        if(!isAdmin) {
            // get invoice by user
            builder.and(invoice.course.author.email.eq(user.getEmail()));
        }

        if(isDelete) {
            builder.and(invoice.deleted.eq(true));
        }
        else {
            builder.and(invoice.deleted.eq(false));
        }

        List<Invoice> listInvoice = queryFactory.selectFrom(invoice)
                .where(builder)
                .offset(page * size)
                .limit(size)
                .fetch();

        int total = (int) queryFactory.selectFrom(invoice)
                .where(builder)
                .fetchCount();


        PageModel<Invoice> pageModel = PageModel.<Invoice>builder()
                .content(listInvoice)
                .totalElements(total)
                .page(page)
                .totalPages((int) Math.ceil((double) total / size))
                .size(size)
                .build();

        return ResponseObject.builder().status(HttpStatus.OK).content(pageModel).build();
    }


    public ResponseObject adminGetInvoices(int page, int size, boolean isDelete) {
        QInvoice invoice = QInvoice.invoice;
        var user = userService.getCurrentUser();

        BooleanBuilder builder = new BooleanBuilder();
        builder.and(invoice.course.author.email.eq(user.getEmail()));

        if(isDelete) {
            builder.and(invoice.deleted.eq(true));
        }
        else {
            builder.and(invoice.deleted.eq(false));
        }

        List<Invoice> listInvoice = queryFactory.selectFrom(invoice)
                .where(builder)
                .offset(page * size)
                .limit(size)
                .fetch();

        int total = (int) queryFactory.selectFrom(invoice)
                .where(builder)
                .fetchCount();


        PageModel<Invoice> pageModel = PageModel.<Invoice>builder()
                .content(listInvoice)
                .totalElements(total)
                .page(page)
                .totalPages((int) Math.ceil((double) total / size))
                .size(size)
                .build();

        return ResponseObject.builder().status(HttpStatus.OK).content(pageModel).build();
    }

    public ResponseObject restoreInvoice(UUID id) {
        var invoice = invoiceRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Invoice not found"));

        invoice.setDeleted(false);
        invoiceRepository.save(invoice);
        return ResponseObject.builder().status(HttpStatus.OK).message("Restore successfully").build();
    }

    public ResponseObject softDelete(UUID id) {
        var invoice = invoiceRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Invoice not found"));

        invoice.setDeleted(true);
        invoiceRepository.save(invoice);
        return ResponseObject.builder()
                .status(HttpStatus.OK)
                .message("Deleted successfully")
                .build();
    }

//    public ResponseObject restoreInvoice(UUID id) {
//        var invoice = invoiceRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Invoice not found"));
//
//        invoice.setDeleted(false);
//        invoiceRepository.save(invoice);
//        return ResponseObject.builder().status(HttpStatus.OK).message("Restore successfully").content(invoiceRepository.findAllIDeleteInvoicesWithSelectedUserFields(PageRequest.of(0, 5))).build();
//    }


    public void saveForUser(User user, Course course, MethodPayment methodPayment) {
        Invoice invoice = Invoice.builder()
                .user(user)
                .method(methodPayment)
                .content("Enroll for course " + course.getTitle())
                .course(course)
                .total(course.getPrice().getPrice())
                .build();
        invoiceRepository.save(invoice);
    }

//    public ResponseObject getByDateRange(String start, String end, int page, int size) {
//        LocalDateTime startDate = LocalDateTime.parse(start);
//        Page<InvoiceDTO> invoices = null;
//        if(Objects.equals(start, end)) {
//            int day = startDate.getDayOfMonth();
//            int month = startDate.getMonthValue();
//            int year = startDate.getYear();
//            invoices = invoiceRepository.findAllByDate(day, month, year, PageRequest.of(page, size));
//        }
//        else {
//            LocalDateTime endDate = LocalDateTime.parse(end);
//            invoices = invoiceRepository.findAllByDateBetween(startDate, endDate, PageRequest.of(page, size));
//        }
//        return ResponseObject.builder().status(HttpStatus.OK).content(invoices).build();
//    }

}
