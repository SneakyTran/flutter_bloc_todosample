import 'package:flutter/material.dart';

class CircleShape extends StatelessWidget {
  final double rad;
  final Color color;
  const CircleShape({super.key, required this.rad, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: rad,
      height: rad,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
