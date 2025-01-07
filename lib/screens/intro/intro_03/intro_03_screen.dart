import 'package:flutter/material.dart';
import '../../login/login/login_screen.dart';
import 'widget/content_section.dart';
import 'widget/progress_indicators.dart';
import 'widget/skip_button.dart';
import 'widget/get_started_button.dart';

class Intro03Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF), // Màu nền
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Nút Skip
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: SkipButton(nextScreen: LoginScreen()),
              ),
            ),
            // Nội dung chính
            Expanded(
              child: ContentSection(
                title: "Get Online Certificate",
                description: "Analyse your scores and Track your results.",
              ),
            ),
            // Progress indicators và nút Get Started
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressIndicators(
                    totalSteps: 3,
                    currentStep: 2,
                  ),
                  GetStartedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
