import 'package:get/get.dart';
import 'package:mobile_app/app/models/course.dart';
import 'package:mobile_app/app/services/course_service.dart';

class CourseController extends GetxController {
  var courses = <Course>[].obs;
  var categories = <String>[].obs;
  var filteredCourses = <Course>[].obs;
  var selectedCategory = 'All'.obs;

  final CourseService _courseService = CourseService();

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  void fetchCourses() async {
    try {
      final fetchedCourses = await _courseService.fetchCourses();
      courses.assignAll(fetchedCourses);
      categories.assignAll(['All', ...fetchedCourses
          .expand((course) => course.categories ?? [])
          .toSet()]);
      filteredCourses.assignAll(fetchedCourses);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void filterCourses(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      filteredCourses.assignAll(courses);
    } else {
      filteredCourses.assignAll(
        courses.where((course) => course.categories?.contains(category) ?? false),
      );
    }
  }
}
