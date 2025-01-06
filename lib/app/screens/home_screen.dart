import 'package:flutter/material.dart';
import '../widgets/home_widgets/categories_section.dart';
import '../widgets/home_widgets/mentors_section.dart';
import '../widgets/home_widgets/promo_banner.dart';
import '../widgets/home_widgets/search_bar.dart';
import '../widgets/home_widgets/status_bar.dart';
import '../widgets/home_widgets/user_header.dart';
import '../widgets/home_widgets/courses_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = ''; // Danh mục được chọn

  final courses = [
    {
      'title': 'Graphic Design Advanced',
      'category': 'Graphic Design',
      'price': '850',
      'rating': 4.2,
      'students': 7830,
      'imageUrl': 'https://vtiacademy.edu.vn/upload/images/hoc-code-1.png',
    },
    {
      'title': 'Advertisement Designing',
      'category': 'Graphic Design',
      'price': '400',
      'rating': 4.2,
      'students': 0,
      'imageUrl': 'https://vtiacademy.edu.vn/upload/images/hoc-code-1.png',
    },
    {
      'title': 'Photography Basics',
      'category': 'Photography',
      'price': '500',
      'rating': 4.8,
      'students': 1200,
      'imageUrl': 'https://vtiacademy.edu.vn/upload/images/hoc-code-1.png',
    },
    {
      'title': 'Music Theory Basics',
      'category': 'Music',
      'price': '300',
      'rating': 4.1,
      'students': 500,
      'imageUrl': 'https://vtiacademy.edu.vn/upload/images/hoc-code-1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCourses = selectedCategory.isEmpty
        ? courses
        : courses
        .where((course) => course['category'] == selectedCategory)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              const UserHeader(),
              const SearchBarScreen(),
              const PromoBanner(),
              CategoriesSection(
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              CoursesSection(courses: filteredCourses),
              const MentorsSection(),
              const SizedBox(height: 37),
              const BottomIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomIndicator extends StatelessWidget {
  const BottomIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
