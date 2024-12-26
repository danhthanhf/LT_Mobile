import 'dart:convert';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  final Map<String, dynamic> post; // Bài viết dưới dạng Map

  const PostDetailScreen(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post['title']), // Hiển thị tiêu đề bài viết
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hiển thị ảnh nếu có base64Image
            Image.network(post['img'] ?? ''),
            const SizedBox(height: 16),

            // Hiển thị ID
            Text(
              "ID: ${post['id']}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Hiển thị tiêu đề
            Text(
              post['title'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Hiển thị nội dung
            Text(
              post['body'],
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
