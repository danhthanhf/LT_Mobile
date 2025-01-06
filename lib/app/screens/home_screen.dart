import 'package:flutter/material.dart';
import '../widgets/home_widgets/categories_section.dart';
import '../widgets/home_widgets/mentors_section.dart';
import '../widgets/home_widgets/promo_banner.dart';
import '../widgets/home_widgets/search_bar.dart';
import '../widgets/home_widgets/user_header.dart';
import '../widgets/home_widgets/courses_section.dart';
import '../widgets/home_widgets/home_page/search_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

  final courses = [
    {
      'title': 'Graphic Design Advanced',
      'category': 'Graphic Design',
      'price': '850',
      'rating': 4.2,
      'students': 7830,
      'imageUrl': 'https://vtiacademy.edu.vn/upload/images/hoc-code-1.png',
      'description': 'Learn the basics of music theory in this beginner-friendly course. Understand the core principles of scales, chords, and music composition.'
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
      'description': 'Learn the basics of music theory in this beginner-friendly course. Understand the core principles of scales, chords, and music composition.'
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
    final categories = [
      'All',
      ...{...courses.map((course) => course['category'] as String)}
    ];
    final filteredCourses = selectedCategory == 'All'
        ? courses
        : courses
        .where((course) => course['category'] == selectedCategory)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              const UserHeader(),
              SearchBarScreen(
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },),
              const PromoBanner(),
              CategoriesSection(
                categories: categories,
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              CoursesSection(
                  context: context,
                  courses: filteredCourses,
                  selectedCategory: selectedCategory,
                categories: categories,
              ),
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
