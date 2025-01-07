import 'package:do_an/controller/authe_controller.dart';
import 'package:do_an/screens/home/home_screen.dart';
import 'package:do_an/screens/register/register_screen.dart';
import 'package:do_an/screens/sign_in/widget/social_login_button.dart';
import 'package:do_an/screens/sign_in/widget/terms_checkbox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'widget/custom_button.dart';
import 'widget/custom_text_field.dart';
import 'widget/terms_checkbox.dart';


class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController controller = Get.put(AuthController());
  final RxBool _isChecked = false.obs; // Thêm trạng thái checkbox

  // Hàm xử lý thay đổi email
  void onEmailChange(String value) {
    controller.request.value.email = value;
  }

  // Hàm xử lý thay đổi password
  void onPasswordChange(String value) {
    controller.request.value.password = value;
  }

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
                  "Let's Sign In.!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Jost',
                    color: Color(0xFF202244),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Login to Your Account to Continue your Courses',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mulish',
                    color: Color(0xFF545454),
                  ),
                ),
                const SizedBox(height: 50),
                Obx(() {
                  return
                   Column(
                     children: [
                      CustomTextField(
                        value: controller.request.value.email,
                      label: 'Email',
                      onHandleChange: onEmailChange, // Pass reference to the function
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      )
                     ],
                   );
                }),
                const SizedBox(height: 20),
                Obx(() {
                  return
                    Column(
                      children: [
                        CustomTextField(
                          value: controller.request.value.password,
                          label: 'Password',
                          onHandleChange: onPasswordChange, // Pass reference to the function
                          icon: Icons.lock,
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                        )
                      ],
                    );
                }),
                // const SizedBox(height: 20),
                // const TermsCheckbox(),
                const SizedBox(height: 35),
                CustomButton(
                  text: 'Sign In',
                  onPressed: () async {
                    await controller.login(
                      _emailController.text,
                      _passwordController.text,
                    );
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
                        // Xử lý đăng nhập bằng Google
                        Get.snackbar("Google Login", "This feature is under development.");
                      },
                    ),
                    const SizedBox(width: 16),
                    SocialLoginButton(
                      imagePath: 'assets/icons/apple_icon.png',
                      onPressed: () {
                        // Xử lý đăng nhập bằng Apple
                        Get.snackbar("Apple Login", "This feature is under development.");
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
                          text: 'SIGN UP',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0961F5),
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
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
        children: [
          Image.asset(
            'assets/images/logo_intro.png',
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/text_intro.png',
                  width: 140,
                  height: 30,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 4),
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
