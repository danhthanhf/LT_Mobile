import 'package:do_an/screens/profile/edit_profile/widget/profile_avatar.dart';
import 'package:do_an/screens/profile/edit_profile/widget/profile_form.dart';
import 'package:do_an/screens/profile/edit_profile/widget/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF5F9FF),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: const Column(
                children: [
                  ProfileHeader(),
                  SizedBox(height: 23),
                  ProfileAvatar(),
                  SizedBox(height: 95),
                  ProfileForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}