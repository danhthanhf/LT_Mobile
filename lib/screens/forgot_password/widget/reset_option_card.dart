import 'package:flutter/material.dart';

class ResetOptionCard extends StatelessWidget {
  const ResetOptionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(21, 21, 72, 21),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset('assets/images/email_via.png', width: 36),
          const SizedBox(width: 15),
          Expanded(  // Added Expanded to avoid overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Via Email',
                  style: TextStyle(
                    color: const Color(0xFF505050),
                    fontSize: 12,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'priscilla.frank26@gmail.com',
                  style: TextStyle(
                    color: const Color(0xFF202244),
                    fontSize: 14,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
