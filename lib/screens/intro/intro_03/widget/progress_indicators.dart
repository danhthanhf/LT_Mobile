import 'package:flutter/material.dart';

class ProgressIndicators extends StatelessWidget {
  final int totalSteps; // Tổng số chấm
  final int currentStep; // Chấm hiện tại đang hoạt động
  final Color activeColor; // Màu chấm hoạt động
  final Color inactiveColor; // Màu chấm không hoạt động

  const ProgressIndicators({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.activeColor = const Color(0xFF0961F5),
    this.inactiveColor = const Color(0xFFD6D6D6),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSteps,
            (index) => _buildIndicator(isActive: index == currentStep),
      ),
    );
  }

  Widget _buildIndicator({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 12.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
