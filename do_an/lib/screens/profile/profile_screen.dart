import 'package:do_an/routes.dart';
import 'package:do_an/screens/course/curriculum/curriculum_screen.dart';
import 'package:do_an/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Get.toNamed(AppRoutes.CURRICULUM);
        }, child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
