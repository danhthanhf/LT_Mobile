import 'package:flutter/material.dart';

class SearchBarScreen extends StatelessWidget {
  final VoidCallback onTap; // Callback khi nhấn vào SearchBar

  const SearchBarScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Kích hoạt callback khi nhấn
      child: Container(
        margin: const EdgeInsets.only(top: 44),
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 400),
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
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.search,
                size: 24,
                color: Colors.black,
              ),
            ),
            const Expanded(
              child: Text(
                'Search for...',
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFB4BDC4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
