import 'package:flutter/material.dart';

class MentorsSection extends StatelessWidget {
  const MentorsSection({Key? key}) : super(key: key);

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
                'Top Mentor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'SEE ALL',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          Row(
            children: const [
              MentorAvatar(
                name: 'TniCiu',
                imageUrl:
                'https://scontent.fsgn5-5.fna.fbcdn.net/v/t39.30808-1/471431900_2063247847466004_564375788799432972_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=108&ccb=1-7&_nc_sid=e99d92&_nc_eui2=AeFoHZgWTxSUWv_nBVyG4iAn3F6sjwVL5N_cXqyPBUvk39gR2SmFDQ4_2KMGqG_quPK58SSnimbxLZRoUkB5BXMo&_nc_ohc=zuAUTyyzovcQ7kNvgFz3_2Q&_nc_zt=24&_nc_ht=scontent.fsgn5-5.fna&_nc_gid=Az45-JpPdSZCV3Gq-FDP_DN&oh=00_AYD1-qcc_n3xrzKDjp8Y3gg-FInLxUAd6MLmuk-DOZV_Sw&oe=678172B0',
              ),
              SizedBox(width: 8),
              MentorAvatar(
                name: 'Thành Con',
                imageUrl:
                'https://res.cloudinary.com/ddmsl3meg/image/upload/v1736159133/vwwmalcbd2ldrn7ss5nw.jpg',
              ),
              SizedBox(width: 8),
              MentorAvatar(
                name: 'Trí cu',
                imageUrl:
                'https://res.cloudinary.com/ddmsl3meg/image/upload/v1736159133/wmq2l620ustcfgjgscvq.jpg',
              ),
              SizedBox(width: 8),
              MentorAvatar(
                name: 'Tân Mận',
                imageUrl:
                'https://res.cloudinary.com/ddmsl3meg/image/upload/v1736159133/dlamw4dzbaoehq5by9ew.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MentorAvatar extends StatelessWidget {
  final String name;
  final String imageUrl;

  const MentorAvatar({Key? key, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(imageUrl), // Hiển thị ảnh từ URL
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
