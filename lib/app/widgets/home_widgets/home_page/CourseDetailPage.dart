import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseDetailPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Course Detail',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F9FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh và nút floating
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      course['imageUrl'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16, // Đặt khoảng cách phù hợp để nút không bị cắt
                  right: 16,
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00796B), // Màu xanh đậm
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 28, // Điều chỉnh kích thước biểu tượng nếu cần
                      ),
                      onPressed: () {
                        // Hành động khi bấm nút
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Tiêu đề và thông tin chi tiết
            Text(
              course['title'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202244),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  course['category'],
                  style: const TextStyle(
                    color: Color(0xFFFF6B00),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.star, color: Colors.orange, size: 16),
                Text(
                  course['rating'].toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 16),
                Text(
                  '${course['students']} students',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // TabBar: About | Curriculum
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: const Color(0xFF0961F5),
                    labelColor: const Color(0xFF202244),
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: 'About'),
                      Tab(text: 'Curriculum'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 150,
                    child: TabBarView(
                      children: [
                        Text(
                          course['description'] ?? 'No description available.',
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Text(
                          'Curriculum details will be shown here.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Instructor
            const Text(
              'Instructor',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Thay bằng ảnh giảng viên
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Robert Jr',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      course['category'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // What You'll Get
            const Text(
              "What You'll Get",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ListTile(
                  leading: Icon(Icons.video_library, color: Colors.teal),
                  title: Text('25 Lessons'),
                ),
                ListTile(
                  leading: Icon(Icons.mobile_friendly, color: Colors.teal),
                  title: Text('Access Mobile, Desktop & TV'),
                ),
                ListTile(
                  leading: Icon(Icons.book, color: Colors.teal),
                  title: Text('Audio Book'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Reviews
            const Text(
              'Reviews',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              title: const Text('Will'),
              subtitle: const Text('This course has been very useful.'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.star, color: Colors.orange),
                  Text('4.5'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Nút Enroll
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý đăng ký
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0961F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Enroll Course ',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Màu chữ trắng
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
