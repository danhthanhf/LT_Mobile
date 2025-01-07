import 'package:flutter/material.dart';
import '../widgets/home_widgets/categories_section.dart';
import '../widgets/home_widgets/mentors_section.dart';
import '../widgets/home_widgets/promo_banner.dart';
import '../widgets/home_widgets/search_bar.dart';
import '../widgets/home_widgets/user_header.dart';
import '../widgets/home_widgets/courses_section.dart';
import '../widgets/home_widgets/home_page/search_page.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Xử lý dữ liệu categories và courses từ HomeController
        final categories = [
          'All',
          ...homeController.categories
        ];

        final filteredCourses = homeController.selectedCategory.value == 'All'
            ? homeController.courses
            : homeController.courses.where((course) =>
        course.categories?.contains(homeController.selectedCategory.value) ?? false).toList();

        return SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              children: [
                const UserHeader(),
                SearchBarScreen(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SearchCoursesPage()),
                    );
                  },
                ),
                const PromoBanner(),
                CategoriesSection(
                  categories: categories,
                  onCategorySelected: (category) {
                    homeController.selectedCategory.value = category;
                  },
                ),
                CoursesSection(
                  context: context,
                  courses: filteredCourses,
                  selectedCategory: homeController.selectedCategory.value,
                  categories: categories,
                ),
                MentorsSection(mentors: homeController.mentors),
                const SizedBox(height: 37),
                const BottomIndicator(),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class BottomIndicator extends StatelessWidget {
  const BottomIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
