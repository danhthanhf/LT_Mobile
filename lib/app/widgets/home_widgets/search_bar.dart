import 'package:flutter/material.dart';

class SearchBarScreen extends StatelessWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Semantics(
        label: 'Search field',
        child: TextFormField(
          style: const TextStyle(
            fontFamily: 'Mulish',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFFB4BDC4),
          ),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                Icons.search, // Thay thế bằng icon tìm kiếm
                size: 24, // Kích thước biểu tượng
                color: Colors.black, // Màu biểu tượng
              ),
            ),
            hintText: 'Search for..',
            hintStyle: const TextStyle(
              fontFamily: 'Mulish',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFFB4BDC4),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 13,
            ),
          ),
        ),
      ),
    );
  }
}
