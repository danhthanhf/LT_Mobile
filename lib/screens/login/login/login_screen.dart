import 'package:do_an/screens/login/login/widget/custom_divider.dart';
import 'package:do_an/screens/login/login/widget/sign_in_button.dart';
import 'package:do_an/screens/login/login/widget/social_login_button.dart';
import 'package:do_an/screens/register/register_screen.dart';
import 'package:do_an/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 300),
            child: Column(
              children: [
                const SizedBox(height: 80), // Khoảng cách từ trên cùng
                const Text(
                  "Let's you in",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Jost',
                    color: Color(0xFF202244),
                  ),
                ),
                const SizedBox(height: 40), // Khoảng cách dưới tiêu đề
                SocialLoginButton(
                  icon: 'assets/icons/google_icon.png',
                  text: 'Continue with Google',
                  onPressed: () {},
                ),
                const SizedBox(height: 24),
                SocialLoginButton(
                  icon: 'assets/icons/apple_icon.png',
                  text: 'Continue with Github',
                  onPressed: () {},
                ),
                const SizedBox(height: 40),
                const CustomDivider(),
                const SizedBox(height: 30),
                SignInButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),));
                  },
                ),

                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Mulish',
                      color: Color(0xFF545454),
                    ),
                    children: [
                      const TextSpan(text: "Don't have an Account? "),
                      TextSpan(
                        text: 'SIGN UP',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0961F5),
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
