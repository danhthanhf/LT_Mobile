import 'package:do_an/controllers/my_course_controller.dart';
import 'package:do_an/models/user_course_progress.dart';
import 'package:do_an/screens/course/curriculum/widget/status_bar.dart';
import 'package:do_an/screens/course/my_course/widget/course_card.dart';
import 'package:do_an/screens/course/my_course/widget/filter_tabs.dart';
import 'package:do_an/screens/course/my_course/widget/search_bar.dart';
import 'package:do_an/utils/convert_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyCourseController controller = Get.put(MyCourseController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusBar(),
               Padding(
                padding: EdgeInsets.fromLTRB(33, 40, 14, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomSearchBar(),
                    const SizedBox(height: 20),
                    const FilterTabs(),
                    const SizedBox(height: 24),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                CircularProgressIndicator(backgroundColor: ,),
                                SizedBox(height: 20),
                                Text("Loading..."),
                              ],
                            )
                        );
                      } else {
                        return Column(
                          children: controller.courseList.value.map((course) {
                            return  Column(
                              children: [
                                CourseCard(
                                  title: course.getCourse.title ?? '',
                                  category: "Web Development",
                                  rating: course.myRating ?? 0.0,
                                  duration: ConvertService.convertDuration(course.course.totalDuration ?? 0),
                                ),
                                const SizedBox(height: 28),
                              ],
                            );
                          }).toList(),
                        );
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}