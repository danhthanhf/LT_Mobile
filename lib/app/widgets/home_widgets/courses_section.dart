import 'package:flutter/material.dart';

Widget CoursesSection({required List<Map<String, dynamic>> courses}) {
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
    child: SingleChildScrollView(
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
  );
}
