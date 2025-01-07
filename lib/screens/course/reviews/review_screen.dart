import 'package:do_an/screens/course/reviews/widget/rating.dart';
import 'package:do_an/screens/course/reviews/widget/rating_filter.dart';
import 'package:do_an/screens/course/reviews/widget/revew_card.dart';
import 'package:do_an/screens/course/reviews/widget/status_bar.dart';
import 'package:flutter/material.dart';


class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFF5F9FF),
            padding: const EdgeInsets.only(left: 33),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StatusBar(),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Image.asset(
                      'assets/review_icon.png',
                      width: 26,
                      height: 20,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Reviews',
                      style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF202244),
                      ),
                    ),
                  ],
                ),
                const RatingSummary(),
                const SizedBox(height: 20),
                const RatingFilter(),
                const SizedBox(height: 22),
                const ReviewCard(
                  name: 'Heather S. McMullen',
                  rating: 4.2,
                  review: 'The Course is Very Good dolor sit amet, con sect tur adipiscing elit. Naturales divitias dixit parab les esse..',
                  likes: 760,
                  timeAgo: '2 Weeks Agos',
                ),
                const SizedBox(height: 15),
                const ReviewCard(
                  name: 'Natasha B. Lambert',
                  rating: 4.8,
                  review: 'The Course is Very Good dolor veterm, quo etiam utuntur hi capiamus..',
                  likes: 918,
                  timeAgo: '2 Weeks Agos',
                ),
                const SizedBox(height: 15),
                const ReviewCard(
                  name: 'Marshall A. Lester',
                  rating: 4.6,
                  review: 'The Course is Very Good dolor sit amet, con sect tur adipiscing elit. Naturales divitias dixit parab les esse..',
                  likes: 914,
                  timeAgo: '2 Weeks Agos',
                ),
                const SizedBox(height: 15),
                const ReviewCard(
                  name: 'Frances D. Stanford',
                  rating: 4.8,
                  review: 'The Course is Very Good dolor veterm, Vestri hac verecundius constatius..',
                  likes: 0,
                  timeAgo: '',
                  showWriteReview: true,
                ),
                const SizedBox(height: 13),
                Center(
                  child: Container(
                    width: 134,
                    height: 5,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E6EA),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}