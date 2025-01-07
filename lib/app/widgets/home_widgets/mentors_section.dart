import 'package:flutter/material.dart';
import 'package:mobile_app/app/models/mentor.dart';
class MentorsSection extends StatelessWidget {
  final List<Mentor> mentors;

  const MentorsSection({Key? key, required this.mentors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Mentors',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Text(
                      'SEE ALL',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0961F5),
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Color(0xFF0961F5),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          mentors.isEmpty
              ? const Text('No mentors available')
              : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: mentors.map((mentor) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: MentorAvatar(
                    mentor: mentor, // Truyền từng mentor vào MentorAvatar
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MentorAvatar extends StatelessWidget {
  final Mentor mentor; // Nhận một Mentor duy nhất

  const MentorAvatar({Key? key, required this.mentor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(
            mentor.avatarUrl, // Sử dụng avatarUrl từ Mentor
          ),
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(height: 4),
        Text(
          mentor.firstName, // Sử dụng firstName từ Mentor
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
