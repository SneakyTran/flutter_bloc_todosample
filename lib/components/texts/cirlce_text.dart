import 'package:flutter/material.dart';

class CircleText extends StatelessWidget {
  const CircleText({
    super.key,
    required this.radius,
    required this.color,
    this.opacityBg = 0.3,
    required this.text,
    this.textStyle,
  });
  final double radius;
  final Color color;
  final String text;
  final TextStyle? textStyle;
  final double opacityBg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        color: color.withOpacity(opacityBg),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: color,
              ),
        ),
      ),
    );
  }
}
