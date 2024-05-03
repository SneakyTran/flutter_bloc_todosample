import 'package:flutter/material.dart';

class CircleBlurShape extends StatelessWidget {
  final double rad;
  final Color color;
  final double? opacity;
  final double? spreadRadius;
  // final Color shapeColor;
  const CircleBlurShape({
    super.key,
    required this.rad,
    required this.color,
    this.opacity,
    this.spreadRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: rad,
      height: rad,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // gradient: LinearGradient(
        //   colors: [
        //     color,
        //     color.withOpacity(0.15),
        //   ],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
        boxShadow: [
          BoxShadow(
            blurRadius: 100,
            spreadRadius: spreadRadius ?? 2,
            color: color.withOpacity(opacity ?? 1),
          )
        ],
      ),
    );
  }
}
