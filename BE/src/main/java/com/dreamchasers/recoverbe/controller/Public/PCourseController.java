package com.dreamchasers.recoverbe.controller.Public;

import com.dreamchasers.recoverbe.helper.component.ResponseObject;
import com.dreamchasers.recoverbe.service.CourseService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/public/courses")
public class PCourseController {
    private final CourseService courseService;

    @GetMapping("/filter")
    public ResponseEntity<ResponseObject> filterCourses(@RequestParam(defaultValue = "0") int page,
                                                        @RequestParam(defaultValue = "10") int size,
                                                        @RequestParam(defaultValue = "") String title,
                                                        @RequestParam(defaultValue = "") List<UUID> categories,
                                                        @RequestParam(defaultValue = "") String sort) {
        var result = courseService.filterCourses(title, categories, sort, page, size);
        return ResponseEntity.status(result.getStatus()).body(result);
    }

    @GetMapping("/{courseId}/ratings")
    public ResponseEntity<ResponseObject> getRatings(@PathVariable UUID courseId, @RequestParam String comment, @RequestParam(defaultValue = "5") int star, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size) {
        var result = courseService.getRatingsByStarAndComment(courseId, comment, star, page, size);
        return ResponseEntity.status(result.getStatus()).body(result);
    }

    @GetMapping("/{courseId}/ratings/statistic")
    public ResponseEntity<ResponseObject> getRatingStatistic(@PathVariable UUID courseId) {
        var result = courseService.getRatingStatistic(courseId);
        return ResponseEntity.status(result.getStatus()).body(result);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ResponseObject> getCourseById(@PathVariable UUID id, @RequestParam boolean isDeleted){
        var result = courseService.getCourseByIdAndDeleted(id, isDeleted);
        return ResponseEntity.status(result.getStatus()).body(result);
    }

    @GetMapping("/getAll")
    public ResponseEntity<ResponseObject> getAllByPageable(@RequestParam(defaultValue = "0") int page,
                                                           @RequestParam(defaultValue = "5") int size) {
        var result = courseService.getAllPublish(page, size);
        return ResponseEntity.status(result.getStatus()).body(result);
    }

    @GetMapping("")
    public ResponseEntity<ResponseObject> getByTitle(@RequestParam String title){
        var result = courseService.getByTitle(title);
        return ResponseEntity.status(result.getStatus()).body(result);
    }

}
