import 'package:do_an/screens/fill_profile/fill_profile_screen.dart';
import 'package:do_an/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'widget/custom_button.dart';
import 'widget/custom_text_field.dart';
import 'widget/social_login_button.dart';
import 'widget/terms_checkbox.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0, vertical: 18.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 92), // Khoảng cách phía trên cùng
                _buildLogo(),
                const SizedBox(height: 68),
                const Text(
                  'Getting Started.!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Jost',
                    color: Color(0xFF202244),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Create an Account to Continue your allCourses',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mulish',
                    color: Color(0xFF545454),
                  ),
                ),
                const SizedBox(height: 50),
                const CustomTextField(
                  label: 'Email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                const CustomTextField(
                  label: 'Password',
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                const TermsCheckbox(),
                const SizedBox(height: 35),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FillProfileScreen(),));
                  },
                ),
                const SizedBox(height: 25),
                const Center(
                  child: Text(
                    'Or Continue With',
                    style: TextStyle(
                      color: Color(0xFF545454),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish',
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialLoginButton(
                      imagePath: 'assets/icons/google_icon.png',
                      onPressed: () {
                        // Xử lý đăng nhập Google
                      },
                    ),
                    const SizedBox(width: 16),
                    SocialLoginButton(
                      imagePath: 'assets/icons/apple_icon.png',
                      onPressed: () {
                        // Xử lý đăng nhập Apple
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 51),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Mulish',
                        color: Color(0xFF545454),
                      ),
                      children: [
                        const TextSpan(
                          text: 'Already have an Account? ',
                        ),
                        TextSpan(
                          text: 'SIGN IN',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0961F5),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 66),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_intro.png',
            width: 80, // Kích thước logo
            height: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12), // Khoảng cách giữa logo và text
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo trục dọc
              crossAxisAlignment: CrossAxisAlignment.start, // Căn trái cho nội dung
              children: [
                Image.asset(
                  'assets/images/text_intro.png',
                  width: 140, // Kích thước của text hình ảnh
                  height: 30,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 0), // Điều chỉnh khoảng cách với LEARN FROM HOME
                const Text(
                  'LEARN FROM HOME',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF545454),
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
