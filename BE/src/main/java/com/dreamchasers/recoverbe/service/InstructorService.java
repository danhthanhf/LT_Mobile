package com.dreamchasers.recoverbe.service;

import com.dreamchasers.recoverbe.dto.InstructorStatistic;
import com.dreamchasers.recoverbe.dto.InstructorStatisticObject;
import com.dreamchasers.recoverbe.dto.StatisticContent;
import com.dreamchasers.recoverbe.dto.UserBasicDTO;
import com.dreamchasers.recoverbe.entity.CourseKit.*;
import com.dreamchasers.recoverbe.entity.User.Invoice;
import com.dreamchasers.recoverbe.entity.User.QInvoice;
import com.dreamchasers.recoverbe.entity.User.QUser;
import com.dreamchasers.recoverbe.exception.EntityNotFoundException;
import com.dreamchasers.recoverbe.helper.Model.PageModel;
import com.dreamchasers.recoverbe.helper.converters.ConvertService;
import com.dreamchasers.recoverbe.helper.component.ResponseObject;
import com.dreamchasers.recoverbe.enums.CoursePostStatus;
import com.dreamchasers.recoverbe.entity.User.User;
import com.dreamchasers.recoverbe.repository.CourseRepository;
import com.querydsl.core.BooleanBuilder;
import com.querydsl.jpa.JPQLQueryFactory;
import jakarta.transaction.Status;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.web.servlet.filter.OrderedFormContentFilter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional
public class InstructorService {
    private final UserService userService;
    private final CourseRepository courseRepository;
    private final ConvertService convertService;
    private final JPQLQueryFactory queryFactory;
    private final List<CoursePostStatus> availableStatus = List.of(CoursePostStatus.DRAFT, CoursePostStatus.PUBLISHED, CoursePostStatus.PENDING, CoursePostStatus.REJECTED);

    public PageModel<Invoice> getListInvoiceByStartDateAndUser(User user, LocalDateTime startDate, int size, int page) {
        QInvoice invoice = QInvoice.invoice;
        List<Invoice> invoices = queryFactory.selectFrom(invoice)
                .where(
                invoice.course.author.email.eq(user.getEmail())
                        .and(invoice.createdAt.between(startDate, LocalDateTime.now()))
                )
                .offset((long) page * size)
                .limit(size)
                .fetch();
        int total = (int) queryFactory.selectFrom(invoice).where(invoice.course.author.email.eq(user.getEmail())
                .and(invoice.createdAt.between(startDate, LocalDateTime.now()))
        ).fetchCount();
        return PageModel.<Invoice>builder().page(page).size(size).totalPages(total/size).totalElements(total).content(invoices).build();
    }

    public PageModel<Enrollment> getListEnrollmentByStartDateAndUser(User user, LocalDateTime startDate, int size, int page) {
        QEnrollment enrollment = QEnrollment.enrollment;
        List<Enrollment> enrollments = queryFactory.selectFrom(enrollment)
                .where(
                        enrollment.course.author.email.eq(user.getEmail())
                                .and(enrollment.createdAt.between(startDate, LocalDateTime.now()))
                )
                .offset((long) page * size)
                .limit(size)
                .fetch();

        int total = (int) queryFactory.selectFrom(enrollment).where(enrollment.course.author.email.eq(user.getEmail())
                .and(enrollment.createdAt.between(startDate, LocalDateTime.now()))).fetchCount();
        return PageModel.<Enrollment>builder().totalElements(total).page(page).size(size).totalPages(total / size + 1).content(enrollments).build();
    }

    private PageModel<StatisticContent> buildStatisticObject(PageModel<Invoice> invoices, PageModel<Enrollment> enrollments) {
        if(invoices != null) {
            return PageModel.<StatisticContent>builder()
                    .page(invoices.getPage())
                    .size(invoices.getSize())
                    .totalPages(invoices.getTotalPages())
                    .totalElements(invoices.getTotalElements())
                    .content(invoices.getContent().stream().map(convertService::convertInvoiceToStatisticContent).toList())
                    .build();
        }
        else {
            return PageModel.<StatisticContent>builder()
                    .page(enrollments.getPage())
                    .size(enrollments.getSize())
                    .totalPages(enrollments.getTotalPages())
                    .totalElements(enrollments.getTotalElements())
                    .content(enrollments.getContent().stream().map(convertService::convertEnrollmentToStatisticContent).toList())
                    .build();
        }
    }

    public ResponseObject getStatisticByFilter(String type, String dateRange, int size, int page) {
        User user = userService.getCurrentUser();
        PageModel<StatisticContent> object = null;
        LocalDateTime startDate = null;
        LocalDateTime endDate = LocalDateTime.now();

        if(dateRange.equalsIgnoreCase("week")) {
            startDate = endDate.minusDays(7);
        } else if(dateRange.equalsIgnoreCase("month")) {
            startDate = endDate.minusMonths(1);
        } else if(dateRange.equalsIgnoreCase("year")) {
            startDate = endDate.minusYears(1);
        } else {
            startDate = endDate.minusYears(100);
        }

        if(type.equalsIgnoreCase("invoice")) {
            PageModel<Invoice> invoices = getListInvoiceByStartDateAndUser(user, startDate, size, page);
            return ResponseObject.builder().status(HttpStatus.OK).content(buildStatisticObject(invoices, null)).build();

        }

        PageModel<Enrollment> enrollments = getListEnrollmentByStartDateAndUser(user, startDate, size, page);
        return ResponseObject.builder().status(HttpStatus.OK).content(buildStatisticObject(null, enrollments)).build();
    }

    public ResponseObject getTotalStatistic() {
        User user = userService.getCurrentUser();
        List<UUID> courses = queryFactory.select(QCourse.course.id)
                .from(QCourse.course)
                .where(QCourse.course.author.email.eq(user.getEmail()))
                .fetch();

        if (courses.isEmpty()) {
            throw new EntityNotFoundException("No courses found for the user");
        }

        QInvoice invoice = QInvoice.invoice;
        QEnrollment enrollment = QEnrollment.enrollment;
        QRating rating = QRating.rating1;

        BooleanBuilder builderInvoice = new BooleanBuilder();
        builderInvoice.and(invoice.course.author.email.eq(user.getEmail()));

        BooleanBuilder builderEnrollment = new BooleanBuilder();
        builderEnrollment.and(enrollment.course.author.email.eq(user.getEmail()));

        BooleanBuilder builderRating = new BooleanBuilder();
        builderRating.and(rating.courseId.in(courses));

        Integer totalAmountInvoice = Math.toIntExact(
                queryFactory.select(invoice.total.sum())
                        .from(invoice)
                .where(builderInvoice)
                .fetchOne()
        );
        if (totalAmountInvoice == null) {
            totalAmountInvoice = 0;
        }

        Integer totalAmountInvoiceInMonth = Math.toIntExact(queryFactory.select(invoice.total.sum())
                        .from(invoice)
                .where(builderInvoice.and(invoice.createdAt.month().eq(LocalDateTime.now().getMonthValue())))
                .fetchOne());
        if (totalAmountInvoiceInMonth == null) {
            totalAmountInvoiceInMonth = 0;
        }

        Long totalAmountEnrollment = queryFactory.select(enrollment.id.count())
                .from(enrollment)
                .where(builderEnrollment)
                .fetchOne();
        if (totalAmountEnrollment == null) {
            totalAmountEnrollment = 0L;
        }

        Long totalEnrollmentInMonth = queryFactory.select(enrollment.id.count())
                .from(enrollment)
                .where(builderEnrollment.and(enrollment.createdAt.month().eq(LocalDateTime.now().getMonthValue())))
                .fetchOne();
        if (totalEnrollmentInMonth == null) {
            totalEnrollmentInMonth = 0L;
        }

        var statistic = InstructorStatistic.builder()
                .totalAmountInvoice(totalAmountInvoice)
                .totalAmountInvoiceInMonth(totalAmountInvoiceInMonth)
                .totalAmountEnrollment(totalAmountEnrollment.intValue())
                .totalEnrollmentInMonth(totalEnrollmentInMonth.intValue())
                .build();

        return ResponseObject.builder().status(HttpStatus.OK).content(statistic).build();
    }

    public ResponseObject getCourseById(UUID courseId) {
        Course course = courseRepository.findById(courseId).orElseThrow(() -> new EntityNotFoundException("Course not found"));
        var res = convertService.convertToCourseDTO(course);
        return ResponseObject.builder().status(HttpStatus.OK).content(res).build();
    }

    public ResponseObject getAllAvailableCourseByCourseTitleAndCategory(String title, String categoryId, boolean isDeleted, int page, int size) {
        Page<Course> coursePage;

        if (title == null || categoryId == null) {
            return ResponseObject.builder().status(HttpStatus.BAD_REQUEST).message("Title or category id cannot be null").build();
        }
        if(categoryId.equals("0")) {
            coursePage = courseRepository.findByAuthorAndTitleContainingAndStatusInAndDeleted(userService.getCurrentUser(), title, availableStatus, isDeleted, PageRequest.of(page, size));
        }
        else {
            UUID id = UUID.fromString(categoryId);
            coursePage = courseRepository.findByAuthorAndStatusInAndTitleContainingAndCategoriesIdAndDeleted(userService.getCurrentUser(), availableStatus, title, id, isDeleted, PageRequest.of(page, size));
        }

        var result = convertService.convertToPageCourseDTO(coursePage);
        return ResponseObject.builder().status(HttpStatus.OK).content(result).build();
    }

    public ResponseObject getAllCourseDeleteByCategoryId(String status, String categoryId, boolean deleted, int page, int size) {
        Page<Course> coursePage;
        if(Objects.equals(categoryId, "0")) { // category == ALL
            if (Objects.equals(status, "ALL"))
                coursePage = courseRepository.findAllByAuthorAndDeleted(userService.getCurrentUser(), deleted, PageRequest.of(page, size));
            else
                coursePage = courseRepository.findAllByAuthorAndStatusAndDeleted(userService.getCurrentUser(), CoursePostStatus.valueOf(status), deleted, PageRequest.of(page, size));
        }
        else {
            UUID uuid = UUID.fromString(categoryId);
            if (Objects.equals(status, "ALL"))
                coursePage = courseRepository.findAllByCategoriesIdAndAuthorAndDeleted(uuid, userService.getCurrentUser(), deleted, PageRequest.of(page, size));
            else
                coursePage = courseRepository.findAllByCategoriesIdAndStatusAndAuthorAndDeleted(uuid, CoursePostStatus.valueOf(status), userService.getCurrentUser(), deleted, PageRequest.of(page, size));
        }

        var courses = convertService.convertToPageCourseDTO(coursePage);

        return ResponseObject.builder().status(HttpStatus.OK).content(courses).build();
    }

    public ResponseObject getAllByStatusCourse(String status, String categoryId, int page, int size) {
        Page<Course> coursePage;
        status = status.toUpperCase();

        if(Objects.equals(categoryId, "0")) {
            if(Objects.equals(status, "ALL"))
                coursePage = courseRepository.findAllByStatusInAndDeletedAndAuthor(availableStatus, false, userService.getCurrentUser(), PageRequest.of(page, size));
            else
                coursePage = courseRepository.findAllByStatusInAndDeletedAndAuthor(List.of(CoursePostStatus.valueOf(status)), false, userService.getCurrentUser(), PageRequest.of(page, size));
        }
        else {
            UUID uuid = UUID.fromString(categoryId);
            if(Objects.equals(status, "ALL"))
                coursePage = courseRepository.findAllByCategoriesIdAndStatusInAndDeletedAndAuthor(uuid, availableStatus, false, userService.getCurrentUser(), PageRequest.of(page, size));
            else
                coursePage = courseRepository.findAllByCategoriesIdAndStatusInAndDeletedAndAuthor(uuid, List.of(CoursePostStatus.valueOf(status)), false, userService.getCurrentUser(), PageRequest.of(page, size));
        }
        var courses = convertService.convertToPageCourseDTO(coursePage);
        return ResponseObject.builder().status(HttpStatus.OK).content(courses).build();
    }

    public ResponseObject getAllDraftOrPublishCourse(int page, int size) {
        return ResponseObject.builder().status(HttpStatus.OK).content(courseRepository.findAllByStatusIn(availableStatus, PageRequest.of(page, size))).build();
    }

    public ResponseObject getAllCoursePublicByCategoryId(String categoryId, int page, int size) {
        if(categoryId.isEmpty()) {
            return ResponseObject.builder().status(HttpStatus.BAD_REQUEST).message("UUID string cannot be null").build();
        }
        User user = userService.getCurrentUser();
        if (user == null) {
            return ResponseObject.builder().status(HttpStatus.UNAUTHORIZED).message("User not found").build();
        }
        Page<Course> courses = null;
        if(Objects.equals(categoryId, "0")) { // category == ALL
//            courses = courseRepository.findAllByIsPublicAndDeleted(true, false, PageRequest.of(page, size));
        }
        else {
            UUID uuid = UUID.fromString(categoryId);
//            courses = courseRepository.findAllByAuthorAndCategoriesIdAndIsPublic(user, uuid, true, PageRequest.of(page, size));
        }
        return ResponseObject.builder().status(HttpStatus.OK).content(courses).build();
    }


}
