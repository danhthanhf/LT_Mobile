import 'package:do_an/screens/course/curriculum/widget/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../../../../constant.dart';

class LessonItem extends StatelessWidget {
  final String number;
  final String title;
  final String duration;
  final String? video;
  final bool isCompleted;

  const LessonItem({
    Key? key,
    required this.number,
    required this.title,
    required this.video,
    required this.duration, required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if(video != null) {
            Get.to(() => VideoPlayerScreen(videoUrl: video!, title: title));
          }
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            color: const Color(0xFFF5F9FF),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFE8F1FF),
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
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 150), // Giới hạn chiều rộng
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF202244),
                                ),
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
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
                  ],
                ),
                const SizedBox(height: 10,),
                const Divider(
                  color: AppConstants.lineColor,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                )
              ],
            )
        )
    );
  }
}