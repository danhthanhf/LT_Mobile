import 'package:flutter/material.dart';
import 'widget/custom_button.dart';
import 'widget/fill_profile_form.dart';
import 'widget/fill_profile_header.dart';

class FillProfileScreen extends StatelessWidget {

  const FillProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FillProfileHeader(),
                SizedBox(height: 40),
                FillProfileForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
