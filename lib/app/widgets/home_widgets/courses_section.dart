import 'package:flutter/material.dart';
import 'package:mobile_app/app/widgets/home_widgets/home_page/popular_courses_page.dart';

Widget CoursesSection({
  required BuildContext context, // Thêm context vào tham số
  required List<Map<String, dynamic>> courses,
  required String selectedCategory,
  required List<String> categories
}) {
  Widget courseCard({
    required String title,
    required String category,
    required String price,
    required double rating,
    required int students,
    required String imageUrl,
  }) {
    return Container(
      width: 250, // Set fixed width for each card to support horizontal scrolling
      margin: const EdgeInsets.only(right: 20), // Add spacing between cards
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
                imageUrl,
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
                          category,
                          style: const TextStyle(
                            color: Color(0xFFFF6B00),
                            fontSize: 12,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Color(0xFF202244),
                            fontSize: 16,
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w600,
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
                    Text(
                      '$price/-',
                      style: const TextStyle(
                        color: Color(0xFF0961F5),
                        fontSize: 15,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
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
                          rating.toString(),
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
                      '$students Std',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PopularCoursesPage(
                          courses: courses,
                        categories: categories,
                      ),
                    ),
                  );
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
        const SizedBox(height: 10), // Add spacing between title and courses
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: courses.map((course) {
              final isFirst = courses.indexOf(course) == 0; // Kiểm tra phần tử đầu
              return Padding(
                padding: EdgeInsets.only(left: isFirst ? 10 : 0), // Thêm khoảng cách trái cho phần tử đầu
                child: courseCard(
                  title: course['title'],
                  category: course['category'],
                  price: course['price'],
                  rating: course['rating'],
                  students: course['students'],
                  imageUrl: course['imageUrl'],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}
