import 'package:flutter/material.dart';

class RatingSummary extends StatelessWidget {
  const RatingSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '4.8',
          style: TextStyle(
            fontFamily: 'Jost',
            fontSize: 38,
            fontWeight: FontWeight.w600,
            color: Color(0xFF202244),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Based on 448 Reviews',
          style: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}