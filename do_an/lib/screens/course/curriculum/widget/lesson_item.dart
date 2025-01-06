import 'package:flutter/material.dart';

import '../../../../constant.dart';

class LessonItem extends StatelessWidget {
  final String number;
  final String title;
  final String duration;
  final bool isCompleted;

  const LessonItem({
    Key? key,
    required this.number,
    required this.title,
    required this.duration,
    this.isCompleted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F9FF),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFE8F1FF),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        number,
                        style: const TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF202244),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Jost',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF202244),
                        ),
                        softWrap: true,
                        maxLines: 2,
                      ),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF545454),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                isCompleted ? Icons.check_circle : Icons.lock_outline,
                color: Color(0xFF0961F5),
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(
            color: AppConstants.lineColor, // Customize the color
            thickness: 1, // Customize the thickness
            indent: 0, // Customize the left indent
            endIndent: 0, // Customize the right indent
          )
        ],
      )
    );
  }
}