import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final Widget nextScreen;

  const SkipButton({Key? key, required this.nextScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: const Text(
        "Skip",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF232946),
        ),
      ),
    );
  }
}
