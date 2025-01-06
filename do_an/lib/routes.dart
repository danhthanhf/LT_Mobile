import 'package:do_an/bindings/bottom_nav_binding.dart';
import 'package:do_an/bindings/curriculum_binding.dart';
import 'package:do_an/controllers/bottom_nav_controller.dart';
import 'package:do_an/screens/course/curriculum/curriculum_screen.dart';
import 'package:do_an/screens/main_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const HOME = "/";
  static const LOGIN = "/login";
  static const REGISTER = "/register";
  static const PROFILE = "/profile";
  static const CURRICULUM = "/curriculum";
  static const MAIN = "/main";



  List<GetPage> appPages = [
    GetPage(
        name: AppRoutes.CURRICULUM,
        page: () => const CurriculumScreen(),
        // binding: CurriculumBinding()
    ),
    GetPage(
      name: AppRoutes.MAIN,
      page: () => MainPage(),
      binding: BottomNavBinding(),
    ),
  ];

  get getPages => appPages;
}