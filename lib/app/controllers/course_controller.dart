import 'package:get/get.dart';
import 'package:mobile_app/app/models/course.dart';
import 'package:mobile_app/app/services/course_service.dart';

class CourseController extends GetxController {
  final CourseService _courseService = CourseService();

  // Observable variables
  var courses = <Course>[].obs;
  var categories = <String>[].obs;
  var filteredCourses = <Course>[].obs;
  var selectedCategory = 'All'.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      isLoading.value = true;
      final fetchedCourses = await _courseService.fetchCourses();
      courses.assignAll(fetchedCourses);

      final allCategories = fetchedCourses
          .expand((course) => course.categories ?? [])
          .toSet()
          .toList();
      categories.assignAll(['All', ...allCategories]);

      filteredCourses.assignAll(fetchedCourses);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch courses: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchFilteredCourses({
    String? title,
  }) async {
    try {
      isLoading.value = true;
      print('Fetching filtered courses with title: $title');
      final result = await _courseService.fetchFilteredCourses(title: title);
      print('Fetched courses: ${result.length}'); // Kiểm tra số lượng khóa học trả về
      courses.assignAll(result);
      filterCourses(selectedCategory.value); // Áp dụng bộ lọc danh mục nếu cần
    } catch (e) {
      print('Error fetching filtered courses: $e'); // In lỗi nếu có
      Get.snackbar('Error', 'Failed to fetch filtered courses: $e');
    } finally {
      isLoading.value = false;
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
