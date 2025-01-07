import 'package:flutter/material.dart';

class CustomBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bubblePaint = Paint()
      ..color = Color(0xffB9D4DB)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Vẽ các bong bóng (bubbles)
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.15), 8, bubblePaint);
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.2), 10, bubblePaint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.25), 12, bubblePaint);
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.35), 15, bubblePaint);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.55), 10, bubblePaint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.6), 8, bubblePaint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.75), 12, bubblePaint);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.8), 10, bubblePaint);

    // // Vẽ các đường gạch chéo (diagonal lines)
    // canvas.drawLine(
    //   Offset(size.width * 0.15, size.height * 0.2),
    //   Offset(size.width * 0.25, size.height * 0.25),
    //   linePaint,
    // );
    // canvas.drawLine(
    //   Offset(size.width * 0.65, size.height * 0.3),
    //   Offset(size.width * 0.75, size.height * 0.35),
    //   linePaint,
    // );
    // canvas.drawLine(
    //   Offset(size.width * 0.2, size.height * 0.6),
    //   Offset(size.width * 0.3, size.height * 0.65),
    //   linePaint,
    // );
    // canvas.drawLine(
    //   Offset(size.width * 0.6, size.height * 0.7),
    //   Offset(size.width * 0.7, size.height * 0.75),
    //   linePaint,
    // );
    // canvas.drawLine(
    //   Offset(size.width * 0.4, size.height * 0.85),
    //   Offset(size.width * 0.5, size.height * 0.9),
    //   linePaint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
