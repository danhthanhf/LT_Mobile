import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '9:41',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
          ),
        ),
        Row(
          children: [
            Image.asset('assets/signal.png', width: 19, height: 10),
            const SizedBox(width: 6),
            Image.asset('assets/wifi.png', width: 17, height: 11),
            const SizedBox(width: 6),
            Image.asset('assets/battery.png', width: 25, height: 12),
          ],
        ),
      ],
    );
  }
}