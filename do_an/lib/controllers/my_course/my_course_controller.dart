import 'package:do_an/models/user_course_progress.dart';
import 'package:do_an/services/user_course_service.dart';
import 'package:get/get.dart';

class MyCourseController extends GetxController {
  var isCompleted = true.obs;
  var title = ''.obs;
  var courseList = <UserCourseProgress>[].obs;
  Rx<bool> isLoading = false.obs;
  final UserCourseService userCourseService = UserCourseService();
  late Worker debounceWorker;

  @override
  void onInit() {
    super.onInit();
    startDebounce();
    fetchMyCourse();
  }

  @override
  void onClose() {
    super.onClose();
    stopDebounce();
  }

  void startDebounce() {
    debounceWorker = debounce(
      title,
          (_) {
            fetchMyCourse();
      },
      time: const Duration(milliseconds: 400),
    );
  }

  void stopDebounce() {
    debounceWorker.dispose();
  }

  void changeFilter(bool value) {
    isCompleted.value = value;
    fetchMyCourse();
  }

  void changeTitle(String value) {
    title.value = value;
  }

  Future<void> fetchMyCourse() async {
    isLoading.value = true;
    final res = await userCourseService.fetchMyCourse(isCompleted.value, title.value);
    isLoading.value = false;
    courseList.value = res;
  }


}