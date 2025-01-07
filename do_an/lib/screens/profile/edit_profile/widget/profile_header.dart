import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 69),
      child: Row(
        children: [
          Image.asset(
            'assets/images/edit_icon.png',
            width: 26,
            height: 20,
          ),
          const SizedBox(width: 12),
          const Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              fontFamily: 'Jost',
              color: Color(0xFF202244),
            ),
          ),
        ],
      ),
    );
  }
}