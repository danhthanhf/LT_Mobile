import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 33, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Bo tròn hình ảnh
                child: Image.network(
                  'https://scontent.fsgn5-5.fna.fbcdn.net/v/t39.30808-1/471431900_2063247847466004_564375788799432972_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=108&ccb=1-7&_nc_sid=e99d92&_nc_eui2=AeFoHZgWTxSUWv_nBVyG4iAn3F6sjwVL5N_cXqyPBUvk39gR2SmFDQ4_2KMGqG_quPK58SSnimbxLZRoUkB5BXMo&_nc_ohc=zuAUTyyzovcQ7kNvgFz3_2Q&_nc_zt=24&_nc_ht=scontent.fsgn5-5.fna&_nc_gid=Az45-JpPdSZCV3Gq-FDP_DN&oh=00_AYD1-qcc_n3xrzKDjp8Y3gg-FInLxUAd6MLmuk-DOZV_Sw&oe=678172B0',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover, // Đảm bảo hình ảnh không bị méo
                ),
              ),
              const SizedBox(width: 10), // Khoảng cách giữa ảnh và văn bản
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, TniCiu',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Jost',
                      color: Color(0xFF202244),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'What Would you like to learn Today? Search Below.',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Mulish',
                      color: Color(0xCC545454),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
