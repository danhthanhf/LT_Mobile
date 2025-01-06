import 'package:do_an/models/user_course_progress.dart';
import 'package:do_an/services/user_course_service.dart';
import 'package:get/get.dart';

class MyCourseController extends GetxController {
  var isCompleted = true.obs;
  var courseList = <UserCourseProgress>[].obs;
  Rx<bool> isLoading = false.obs;
  final UserCourseService userCourseService = UserCourseService();

  void changeFilter(bool value) {
    isCompleted.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchMyCourse();
  }

  Future<void> fetchMyCourse() async {
    isLoading.value = true;
    final res = await userCourseService.fetchMyCourse();
    print(res);
    isLoading.value = false;
    courseList.value = res;
  }

}