import 'package:do_an/constant.dart';
import 'package:do_an/controllers/my_course/my_course_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FilterTabs extends StatelessWidget {
  const FilterTabs({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final MyCourseController controller = Get.put(MyCourseController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 200,
          child: Obx(() => ElevatedButton(
            onPressed: () {
              controller.changeFilter(true);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: controller.isCompleted.value ? AppConstants.activeBtnColor : AppConstants.inactiveBtnColor,
                padding: const EdgeInsets.symmetric(vertical: 22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                )
            ),
            child:
            Text('Completed',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: controller.isCompleted.value ? Colors.white : Colors.black,
              ),
            ),
          ),)
        ),
        Obx(() =>  SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              controller.changeFilter(false);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: controller.isCompleted.value ? AppConstants.inactiveBtnColor : AppConstants.activeBtnColor,
                padding: const EdgeInsets.symmetric(vertical: 22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                )
            ),
            child:
            Text('Ongoing',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: controller.isCompleted.value ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),)
      ],
    );
  }
}