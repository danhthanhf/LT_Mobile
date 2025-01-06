import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _search = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Perform operations after the widget is rendered
    });

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
          Expanded(  // Đảm bảo TextField chiếm toàn bộ không gian có sẵn
            child: TextField(
              controller: _search,
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