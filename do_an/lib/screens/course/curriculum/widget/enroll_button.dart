import 'package:do_an/constant.dart';
import 'package:do_an/controllers/curriculum/curriculum_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EnrollButton extends StatelessWidget {

  const EnrollButton({
    Key? key,
  }) : super(key: key);
  
  void handlePress(CurriculumController controller) {
    controller.fetchCourseByTitle("Mastering Java - Level 1");
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find();

    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.blueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        elevation: 8,
      ),
      child:
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 30,),
                  const Text(
                    'Enroll Course',
                    style: const TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                 Align(
                   alignment: Alignment.centerRight,
                   child:  Container(
                     width: 48,
                     height: 48,
                     decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.white,
                     ),
                     child: const Icon(
                       Icons.arrow_forward,
                       color: Colors.blue,
                     ),
                   ),
                 ),
                ],
            )
        ),
    );
  }
}