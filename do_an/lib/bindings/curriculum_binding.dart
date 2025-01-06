import 'package:do_an/controllers/curriculum_controller.dart';
import 'package:get/get.dart';
class CurriculumBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<CurriculumController>(() => CurriculumController());
    Get.put(CurriculumController());
  }
}
