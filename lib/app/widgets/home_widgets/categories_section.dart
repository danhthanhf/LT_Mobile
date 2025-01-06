import 'package:flutter/material.dart';

class CategoriesSection extends StatefulWidget {
  final Function(String) onCategorySelected;
  final List<String> categories;
  const CategoriesSection({Key? key, required this.onCategorySelected,required this.categories})
      : super(key: key);

  @override
  _CategoriesSectionState createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All',
      'Graphic Design',
      'Photography',
      'Music',
      'Programming',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Text(
                      'SEE ALL',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0961F5),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios, // Mũi tên
                      size: 12,
                      color: Color(0xFF0961F5),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      widget.onCategorySelected(category);
                    },
                    child: Chip(
                      label: Text(
                        category,
                        style: TextStyle(
                          color: selectedCategory == category
                              ? Colors.white
                              : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: selectedCategory == category
                          ? Colors.teal[800]
                          : const Color(0xFFE0E0E0),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
