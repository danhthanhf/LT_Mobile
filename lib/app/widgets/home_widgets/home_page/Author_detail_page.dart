import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';
import '../../../models/mentor.dart';

class AuthorDetailScreen extends StatelessWidget {
  final Mentor mentor;

  const AuthorDetailScreen({Key? key, required this.mentor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courses = Get.find<HomeController>().courses;
    final filteredCourses = courses
        .where((course) => course.author.firstName == mentor.firstName)
        .toList();

    return Scaffold(
        backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        title: Text('${mentor.firstName}'),
        backgroundColor: const Color(0xFFF5F9FF),
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thông tin tác giả
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(mentor.avatarUrl),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${mentor.firstName} ',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),

                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                      ),
                      child: const Text('Follow'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Danh sách khóa học
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Courses',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    filteredCourses.isEmpty
                        ? const Center(
                      child: Text(
                        'No courses available for this mentor.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                        : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: filteredCourses.length,
                      itemBuilder: (context, index) {
                        final course = filteredCourses[index];
                        return Card(
                          color: Colors.white,

                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0),
                          child: ListTile(
                            leading: Image.network(
                              course.thumbnail,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(course.title),
                            subtitle: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [

                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Colors.orange,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${course.scoreRating}',
                                      style: const TextStyle(
                                          fontSize: 12),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '${course.totalRegister} students',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16),
                            onTap: () {
                              // Navigate to course details
                            },
                          ),
                        );
                      },
                    ),
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
