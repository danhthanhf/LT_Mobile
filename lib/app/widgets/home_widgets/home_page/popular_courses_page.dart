import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/course_controller.dart';
import '../../../widgets/home_widgets/home_page/CourseDetailPage.dart';

class PopularCoursesPage extends StatelessWidget {
  final CourseController controller = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F9FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Popular Courses',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F9FF),
      body: Obx(() {
        // Lấy danh sách khóa học đã lọc từ controller
        final filteredCourses = controller.filteredCourses;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Danh sách các danh mục
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.categories.map((category) {
                    final isSelected = controller.selectedCategory.value == category;
                    return GestureDetector(
                      onTap: () => controller.filterCourses(category),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.teal[800] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Danh sách các khóa học
            Expanded(
              child: filteredCourses.isEmpty
                  ? const Center(child: Text('No courses available'))
                  : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
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
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.horizontal(left: Radius.circular(15)),
                              color: Colors.grey,
                            ),
                            child: ClipRRect(
                              borderRadius:
                              const BorderRadius.horizontal(left: Radius.circular(15)),
                              child: Image.network(
                                course.thumbnail ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course.categories?.join(', ') ?? '',
                                    style: const TextStyle(
                                      color: Color(0xFFFF6B00),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    course.title ?? '',
                                    style: const TextStyle(
                                      color: Color(0xFF202244),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        '${course.price} VND',
                                        style: const TextStyle(
                                          color: Color(0xFF0961F5),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.star, color: Colors.orange, size: 14),
                                      const SizedBox(width: 4),
                                      Text(
                                        course.scoreRating.toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
