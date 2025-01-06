import 'package:do_an/controllers/my_course/my_course_controller.dart';
import 'package:do_an/screens/course/my_course/widget/course_card.dart';
import 'package:do_an/screens/course/my_course/widget/filter_tabs.dart';
import 'package:do_an/screens/course/my_course/widget/search_bar.dart';
import 'package:do_an/utils/convert_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';

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
               Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   CustomSearchBar(),
                    const SizedBox(height: 20),
                    const FilterTabs(),
                    const SizedBox(height: 24),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 40),
                                CircularProgressIndicator(backgroundColor: AppConstants.bgColor,color: AppConstants.blueColor,),
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
                                  thumbnail: course.getCourse.thumbnail ?? '',
                                  category: course.getCourse.categoriesString ?? '',
                                  rating: course.myRating ?? 0.0,
                                  duration: ConvertService.convertDuration(course.course.totalDuration ?? 0),
                                  totalLessons: course.totalLessons ?? 0,
                                  totalCompletedLessons: course.totalCompletedLessons,
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