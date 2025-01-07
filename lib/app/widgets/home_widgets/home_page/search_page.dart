import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/course_controller.dart';
import 'CourseDetailPage.dart';

class SearchCoursesPage extends StatelessWidget {
  final CourseController courseController = Get.put(CourseController());

  SearchCoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF), // Nền tổng thể
      appBar: AppBar(
        title: const Text('Search Courses'),
        backgroundColor: const Color(0xFFF5F9FF),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search courses...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onSubmitted: (query) {
                // Gửi truy vấn hoặc lấy danh sách đầy đủ nếu để trống
                courseController.fetchFilteredCourses(title: query.trim());
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (courseController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (courseController.filteredCourses.isEmpty) {
                return const Center(child: Text('No courses found'));
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: courseController.filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = courseController.filteredCourses[index];
                  return GestureDetector(
                    onTap: () {
                      // Điều hướng đến trang chi tiết khóa học
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseDetailPage(course: course),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white, // Màu nền của khóa học
                      margin: const EdgeInsets.only(bottom: 16),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            child: Image.network(
                              course.thumbnail ?? '',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF202244),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Students: ${course.totalRegister}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.orange, size: 16),
                                    Text(
                                      course.scoreRating.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
