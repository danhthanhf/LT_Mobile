import 'package:do_an/routes.dart';
import 'package:do_an/screens/course/curriculum/curriculum_screen.dart';
import 'package:do_an/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes().getPages,
      home: MainPage(),
      title: "Distant Class",
    );
  }
}
