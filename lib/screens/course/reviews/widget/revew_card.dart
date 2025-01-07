import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final double rating;
  final String review;
  final int likes;
  final String timeAgo;
  final bool showWriteReview;

  const ReviewCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.review,
    required this.likes,
    required this.timeAgo,
    this.showWriteReview = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(20),
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
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontFamily: 'Jost',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF202244),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F1FF),
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                              color: const Color(0xFF4D81E5),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/star.png',
                                width: 12,
                                height: 11,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                rating.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Jost',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF202244),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 9),
                    Text(
                      review,
                      style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (!showWriteReview) ...[
            const SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/like.png',
                      width: 17,
                      height: 16,
                    ),
                    const SizedBox(width: 9),
                    Text(
                      likes.toString(),
                      style: const TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF202244),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Text(
                  timeAgo,
                  style: const TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF202244),
                  ),
                ),
              ],
            ),
          ],
          if (showWriteReview) ...[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0961F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 70,
                  vertical: 15,
                ),
                elevation: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/write.png',
                    width: 17,
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 23),
                  const Text(
                    'Write a Review',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}