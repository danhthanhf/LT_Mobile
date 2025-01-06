import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controllers/my_course/my_course_controller.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController _search = TextEditingController();
  final controller = Get.put(MyCourseController());



  CustomSearchBar({super.key});

  void onSearch(String value) {
    controller.title.value = value;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: _search,
              onChanged: onSearch,
              decoration: const InputDecoration(
                hintText: 'Search for …',
                hintStyle: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFB4BDC4),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8)
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Image.asset('assets/icons/search_icon.png', width: 38, height: 38),
        ],
      ),
    );
  }

}