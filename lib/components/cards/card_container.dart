import 'package:flutter/material.dart';
import 'package:todolistapp/constants.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final Color? backgroundColor;

  const CardContainer({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 22, right: 22, top: 24),
      child: Container(
        width: width ?? double.infinity,
        decoration: kCardBoxDecoration.copyWith(color: backgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
