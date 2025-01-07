import 'package:get/get.dart';
import '../models/course.dart';
import '../models/mentor.dart';
import '../services/home_service.dart';

class HomeController extends GetxController {
  final HomeService _homeService = HomeService();

  var categories = <String>[].obs;
  var courses = <Course>[].obs;
  var mentors = <Mentor>[].obs;
  var isLoading = true.obs;
  var selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  void fetchHomeData() async {
    try {
      isLoading(true);
      final data = await _homeService.fetchHomeData();
      categories.value = data['categories'];
      courses.value = data['courses'];
      mentors.value = data['mentors'];
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load data. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading(false);
    }
  }

  void setSelectedCategory(String category) {
    selectedCategory.value = category;
  }
}