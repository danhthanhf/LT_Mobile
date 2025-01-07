import 'package:flutter/material.dart';

class FillProfileHeader extends StatelessWidget {
  const FillProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context); // Quay lại màn hình trước
            },
            icon: const Icon(Icons.arrow_back, color: Color(0xFF202244)),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Fill Your Profile',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            fontFamily: 'Jost',
            color: Color(0xFF202244),
          ),
        ),
      ],
    );
  }
}
