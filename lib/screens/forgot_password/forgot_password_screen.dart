import 'package:do_an/screens/forgot_password/widget/countinue_button.dart';
import 'package:do_an/screens/forgot_password/widget/header.dart';
import 'package:do_an/screens/forgot_password/widget/reset_option_card.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Header(),
                  const SizedBox(height: 330),  // Adjusted space for header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Select which contact details should we use to Reset Your Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF545454),
                        fontSize: 14,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),  // Adjusted space for description
                  const ResetOptionCard(),
                  const SizedBox(height: 130),  // Reduced space for Continue button
                  const ContinueButton(),
                  const SizedBox(height: 20), // Adjusted space at bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
