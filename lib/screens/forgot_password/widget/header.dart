import 'package:do_an/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xFF202244)),
        ),
        const SizedBox(width: 12),
        const Text(
          'Forgot Password',
          style: TextStyle(
            color: Color(0xFF202244),
            fontSize: 21,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
