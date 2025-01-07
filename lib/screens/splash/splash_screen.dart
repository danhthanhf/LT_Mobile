import 'package:do_an/screens/splash/widget/custom_painter_circle.dart';
import 'package:flutter/material.dart';

import 'widget/custom_painter_bubble.dart'; // Import lớp CustomBubblePainter

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0961F5), // Màu nền chính
      body: Stack(
        children: [
          // Các bong bóng trang trí
          Positioned.fill(
            child: CustomPaint(
              painter: CustomBubblePainter(),
            ),
          ),
          // Các vòng tròn trang trí
          Positioned.fill(
            child: CustomPaint(
              painter: CustomCirclePainter(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/logo_intro.png',
                  width: 120, // Điều chỉnh kích thước logo
                  height: 120,
                ),
                const SizedBox(height: 10), // Khoảng cách giữa logo và hình text
                // Hình ảnh thay cho "DISTANT CLASS"
                Image.asset(
                  'assets/images/text_intro.png',
                  width: 200, // Điều chỉnh kích thước hình text
                  height: 50,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10), // Khoảng cách giữa hình text và text phụ
                // Text phụ "LEARN FROM HOME"
                const Text(
                  "LEARN FROM HOME",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
