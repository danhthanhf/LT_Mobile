import 'package:flutter/material.dart';
import '../intro_02/intro_02_screen.dart';
import 'widget/content_section.dart';
import 'widget/progress_indicators.dart';
import 'widget/skip_button.dart';

class Intro01Screen extends StatelessWidget {
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
                child: SkipButton(nextScreen: Intro02Screen()),
              ),
            ),
            // Nội dung chính
            Expanded(
              child: ContentSection(
                title: "Online Learning",
                description:
                "We Provide Classes Online Classes and Pre Recorded Lectures.!",
              ),
            ),
            // Progress indicators và nút Next
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressIndicators(
                    totalSteps: 3,
                    currentStep: 0,
                  ),
                  FloatingActionButton(
                    backgroundColor: const Color(0xFF0961F5),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Intro02Screen()),
                      );
                    },
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
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
