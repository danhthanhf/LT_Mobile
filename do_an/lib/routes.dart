import 'package:do_an/bindings/bottom_nav_binding.dart';
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
  static const EDIT_PROFILE = "/edit-profile";
  static const PRIVACY = "/privacy";



  List<GetPage> appPages = [
    GetPage(
        name: AppRoutes.CURRICULUM,
        page: () => const CurriculumScreen(),
    ),
    GetPage(
      name: AppRoutes.MAIN,
      page: () => MainPage(),
    ),

  ];

  get getPages => appPages;
}