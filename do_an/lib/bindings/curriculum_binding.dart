import 'package:do_an/controllers/curriculum/curriculum_controller.dart';
import 'package:get/get.dart';
class CurriculumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CurriculumController());
    // Get.put(CurriculumController());
  }
}
