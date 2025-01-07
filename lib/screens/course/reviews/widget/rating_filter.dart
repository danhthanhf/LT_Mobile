import 'package:flutter/material.dart';

class RatingFilter extends StatelessWidget {
  const RatingFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChip(
            label: 'Excellent',
            isSelected: true,
          ),
          const SizedBox(width: 10),
          FilterChip(
            label: 'Good',
            isSelected: false,
          ),
          const SizedBox(width: 10),
          FilterChip(
            label: 'Average',
            isSelected: false,
          ),
          const SizedBox(width: 10),
          FilterChip(
            label: 'Below Average',
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterChip({
    Key? key,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF167F71) : const Color(0xFFE8F1FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF202244),
          fontFamily: 'Mulish',
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}