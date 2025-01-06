import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(33, 17, 14, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '9:41',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
          ),
          Row(
            children: [
              Image.asset('assets/icons/signal.png', width: 19),
              const SizedBox(width: 6),
              Image.asset('assets/icons/wifi.png', width: 17),
              const SizedBox(width: 6),
              Image.asset('assets/icons/battery.png', width: 25),
            ],
          ),
        ],
      ),
    );
  }
}