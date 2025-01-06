import 'package:do_an/controllers/curriculum/curriculum_controller.dart';
import 'package:do_an/screens/course/curriculum/widget/enroll_button.dart';
import 'package:do_an/screens/course/curriculum/widget/lesson_item.dart';
import 'package:do_an/screens/course/curriculum/widget/sction_header.dart';
import 'package:do_an/screens/course/curriculum/widget/status_bar.dart';
import 'package:do_an/utils/convert_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arg = Get.arguments;
    final String title = arg['title'];
    final CurriculumController controller = Get.put(CurriculumController());
    controller.fetchCourseByTitle(title);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F9FF),
        title: const Text(
            "Curriculum",
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
        ),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(33, 17, 14, 69),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Obx(
                      () => controller.isLoading.value ? const CircularProgressIndicator()
                          :
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Column(
                          children: [
                            Column(
                              children: controller.course.value.sections.asMap().entries.map((entry) {
                                int index = entry.key;
                                var section = entry.value;
                                var duration = ConvertService.convertDuration(section.totalDuration ?? 0);

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SectionHeader(
                                      sectionNumber: (index + 1).toString(),
                                      title: section.title ?? '',
                                      duration: "${duration}",
                                    ),
                                    // Lặp qua từng lesson trong section
                                    ...section.lessons.asMap().entries.map((entry) {
                                      var duration = ConvertService.convertDuration(entry.value.duration ?? 0);
                                      var lesson = entry.value;
                                      var index = entry.key;
                                      return LessonItem(
                                        number: (index + 1).toString() ?? '',
                                        title: lesson.title ?? '',
                                        video: lesson.video ?? '',
                                        duration: duration,
                                        isCompleted: false,
                                      );
                                    }).toList(),

                                  ],
                                );
                              }).toList(),
                            ),
                            EnrollButton(
                              price: controller.course.value.price?.toDouble() ?? 0,
                            )
                          ],
                        )
                      )
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}