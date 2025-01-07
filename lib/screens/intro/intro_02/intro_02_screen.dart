import 'package:flutter/material.dart';
import '../intro_03/intro_03_screen.dart';
import 'widget/content_section.dart';
import 'widget/progress_indicators.dart';
import 'widget/skip_button.dart';

class Intro02Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: SkipButton(nextScreen: Intro03Screen()),
              ),
            ),
            Expanded(
              child: ContentSection(
                title: "Learn from Anytime",
                description:
                "Booked or Save the Lectures for Future Reference.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressIndicators(
                    totalSteps: 3,
                    currentStep: 1,
                  ),
                  FloatingActionButton(
                    backgroundColor: const Color(0xFF0961F5),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Intro03Screen()),
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

