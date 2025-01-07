import 'package:do_an/screens/course/reviews/review_screen.dart';
import 'package:do_an/screens/forgot_password/forgot_password_screen.dart';
import 'package:do_an/screens/intro/intro_01/intro_01_screen.dart';
import 'package:do_an/screens/sign_in/sign_in_screen.dart';
import 'package:do_an/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Distant Class',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Intro01Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
