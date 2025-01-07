import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final currentIndex = 1.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}