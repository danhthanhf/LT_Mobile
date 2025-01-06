import 'package:do_an/controllers/bottom_nav_controller.dart';
import 'package:do_an/screens/course/my_course/my_course_screen.dart';
import 'package:do_an/screens/home/home_screen.dart';
import 'package:do_an/screens/navigation_bar/navigation_item.dart';
import 'package:do_an/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());

    void onItemTapped(int index) {
      controller.changeTab(index);
    }

    return Container(
      width: 428,
      decoration: const BoxDecoration(
        color: Color(0xFFF5F9FF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Obx(() => NavigationItem(
                   icon:  'assets/icons/home.svg',
                   iconWidth: 29,
                   textColor: const Color(0xFF167F71),
                   onTap: () {
                     onItemTapped(0);
                   },
                   iconHeight: 36,
                   isSelected: controller.currentIndex.value == 0 ,
                 )
               ),
                Obx(
                    () => NavigationItem(
                      icon: 'assets/icons/my_course.svg',
                      iconWidth: 29,
                      iconHeight: 36,
                      textColor: const Color(0xFF167F71),
                      onTap: () {
                        onItemTapped(1);
                      },
                      isSelected: controller.currentIndex.value == 1,
                    ),
                ),
                Obx(
                    () => NavigationItem(
                      icon: 'assets/icons/profile.svg',
                      iconWidth: 29,
                      onTap: () {
                        onItemTapped(2);
                      },
                      textColor: const Color(0xFF167F71),
                      iconHeight: 36,
                      isSelected: controller.currentIndex.value == 2,
                    ),
                )
              ],
            ),
          ),
          Container(
            width: 134,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFFE2E6EA),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }
}