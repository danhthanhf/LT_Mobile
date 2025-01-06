import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String sectionNumber;
  final String title;
  final String duration;

  const SectionHeader({
    Key? key,
    required this.sectionNumber,
    required this.title,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child:  RichText(
              text: TextSpan(
               children: [
                 TextSpan(
                   text: 'Section $sectionNumber - ',
                   style: const TextStyle(
                     color: Color(0xFF202244),
                     fontFamily: 'Jost',
                     fontSize: 15,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
                 TextSpan(
                   text: title,
                   style: const TextStyle(
                     color: Color(0xFF0961F5),
                     fontFamily: 'Jost',
                     fontSize: 15,
                     fontWeight: FontWeight.w600,
                     height: 1.8,
                   ),
                 ),
               ],
             ),
         )),
          Text(
            duration,
            style: const TextStyle(
              color: Color(0xFF0961F5),
              fontFamily: 'Mulish',
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}