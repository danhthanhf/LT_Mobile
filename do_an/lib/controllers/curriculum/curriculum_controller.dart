import 'package:do_an/models/course.dart';
import 'package:do_an/services/course_service.dart';
import 'package:get/get.dart';

class CurriculumController extends GetxController {
  Rx<Course> course = Course.init().obs;
  final courseService = CourseService();
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // fetchCourseByTitle("Mastering Java - Level 1");
  }

  void updateCourse(Course newCourse) {
    course.value = newCourse;
  }

  Future<void> fetchCourseByTitle(String title) async {
    try {
      isLoading.value = true;
      course.value = await courseService.fetchCourseByTitle(title);
      isLoading.value = false;
    } catch(e) {
      print("Error : $e");
    }
  }

}