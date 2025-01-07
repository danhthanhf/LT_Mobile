import 'package:flutter/material.dart';
import 'package:mobile_app/app/models/course.dart';

Widget CoursesSection({
  required BuildContext context,
  required List<Course> courses,
  required String selectedCategory,
  required List<String> categories
}) {
  Widget courseCard(Course course) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 134,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.black,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                course.thumbnail ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        course.categoriesString,
                          style: const TextStyle(
                            color: Color(0xFFFF6B00),
                            fontSize: 12,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 7),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            course.title ?? 'No title',
                            style: const TextStyle(
                              color: Color(0xFF202244),
                              fontSize: 16,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1, // Giới hạn 1 dòng
                            overflow: TextOverflow.ellipsis, // Hiển thị dấu '...' nếu vượt quá kích thước
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.bookmark_outline,
                      color: Colors.teal,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [

                    const Text(
                      ' | ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rate,
                          color: Colors.orange,
                          size: 12,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          course.scoreRating.toString(),
                          style: const TextStyle(
                            color: Color(0xFF202244),
                            fontSize: 11,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      ' | ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${course.totalRegister} Std',
                      style: const TextStyle(
                        color: Color(0xFF202244),
                        fontSize: 11,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 25.0), // Điều chỉnh padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Courses',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF202244),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PopularCoursesPage(
                  //         courses: courses,
                  //       categories: categories,
                  //     ),
                  //   ),
                  // );
                },
                child: Row(
                  children: const [
                    Text(
                      'SEE ALL',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0961F5),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios, // Mũi tên
                      size: 12,
                      color: Color(0xFF0961F5),
                    ),
                  ],
                ),
              ),
            ],

          ),

        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: courses.map((course) {
              final isFirst = courses.indexOf(course) == 0;
              return Padding(
                padding: EdgeInsets.only(left: isFirst ? 10 : 0),
                child: courseCard(course),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}