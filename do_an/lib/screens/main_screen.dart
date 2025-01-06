import 'package:do_an/controllers/bottom_nav_controller.dart';
import 'package:do_an/screens/course/curriculum/curriculum_screen.dart';
import 'package:do_an/screens/course/my_course/my_course_screen.dart';
import 'package:do_an/screens/home/home_screen.dart';
import 'package:do_an/screens/navigation_bar/bottom_navigation.dart';
import 'package:do_an/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainPage extends StatelessWidget {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  final List<Widget> pages = [
    const HomeScreen(),
    const MyCoursesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: IndexedStack(
        index: bottomNavController.currentIndex.value,
        children: pages,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    ));
  }
}
