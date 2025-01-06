import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
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
            Icon(Icons.signal_cellular_4_bar),
            SizedBox(width: 6),
            Icon(Icons.wifi),
            SizedBox(width: 6),
            Icon(Icons.battery_full),
          ],
        ),
      ],
    );
  }
}