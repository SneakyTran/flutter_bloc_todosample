import 'package:flutter/material.dart';

class IconGroup extends StatelessWidget {
  final Color? iconColor;
  final IconData icon;
  double iconSize;
  // final IconData icon;
  IconGroup({
    super.key,
    this.iconColor,
    required this.icon,
    this.iconSize = 14,
  });

  set setIconSize(double iconSize) {
    this.iconSize = iconSize;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: iconColor?.withOpacity(0.25),
        ),
        // color: iconColor.withOpacity(0.5),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
          weight: 200,
        ));
  }
}
