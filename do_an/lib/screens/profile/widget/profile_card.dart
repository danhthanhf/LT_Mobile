import 'package:do_an/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned( // xac dinh vi tri cua widget con trong stack
                // top: 0, left: 0, right: 0, bottom: 0,
                child: Container(
                  width: 118,
                  height: 118,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF167F71),
                      width: 4,
                    ),
                    color: const Color(0xFFD8D8D8),
                  ),
                  child: ClipOval(
                    // child: Image.asset(
                    //   'assets/icons/avatar.png', // Replace with your avatar image path
                    //   fit: BoxFit.cover,
                    //   width: 118,
                    //   height: 118,
                    // ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Alex',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'Jost',
              color: Color(0xFF202244),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'hernandex.redial@gmail.ac.in',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Mulish',
              color: Color(0xFF545454),
            ),
          ),
          _buildProfileOption("assets/icons/edit_profile_icon.png", 'Edit Profile', AppRoutes.EDIT_PROFILE),
          _buildProfileOption("assets/icons/privacy_icon.png", 'Terms & Conditions', AppRoutes.PRIVACY),
          const Spacer(),
          _buildProfileOption("assets/icons/logout_icon.png", "Logout", ""),
        ],
      ),
    );
  }

  Widget _buildProfileOption(String icon, String title, String toPage) {
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: GestureDetector(
        onTap: () {
          if(toPage.isNotEmpty) return;
          Get.toNamed(toPage);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  icon,
                  width: 16,
                  height: 20,
                ),
                const SizedBox(width: 14),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Mulish',
                    color: Color(0xFF202244),
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/icons/right_arrow_icon.png',
              width: 10,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }

}