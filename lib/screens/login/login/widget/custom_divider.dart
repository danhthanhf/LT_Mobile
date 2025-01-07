import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '( Or )',
      style: TextStyle(
        color: Color(0xFF545454),
        fontSize: 15,
        fontWeight: FontWeight.w600,
        fontFamily: 'Mulish',
      ),
    );
  }
}
