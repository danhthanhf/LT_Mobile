import 'package:do_an/constant.dart';
import 'package:do_an/screens/profile/widget/profile_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",
            style: TextStyle(
            fontFamily: AppConstants.fontJost,
            fontWeight: FontWeight.w600,
            fontSize: 28
          ),
        ),
        centerTitle: true,
        backgroundColor: AppConstants.bgColor,
        elevation: 0,
      ),
      backgroundColor: AppConstants.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppConstants.bgColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   ProfileCard()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
