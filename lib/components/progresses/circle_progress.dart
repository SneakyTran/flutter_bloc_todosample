import 'package:flutter/material.dart';
import 'package:todolistapp/constants.dart';

class CircleProgress extends StatelessWidget {
  const CircleProgress({
    super.key,
    this.startValue,
    required this.endValue,
    this.width,
    this.circleColor,
    this.strokeWidth,
    this.bgOpacity = 0.3,
    this.textStyle,
  });

  final double? startValue;
  final double endValue;
  final double? width;
  final Color? circleColor;
  final TextStyle? textStyle;
  final double? strokeWidth;
  //opacity color
  final double _mainOpacity = 0.9;
  final double bgOpacity;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(
          begin: startValue == null ? 0.0 : startValue! / 100,
          end: endValue / 100),
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      builder: (context, value, _) => Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Transform.flip(
              child: SizedBox(
                width: width ?? 75,
                height: width ?? 75,
                child: Transform.rotate(
                  angle: 1.5,
                  child: CircularProgressIndicator(
                    value: value,
                    color: circleColor == null
                        ? Colors.white.withOpacity(_mainOpacity)
                        : circleColor?.withOpacity(_mainOpacity),
                    strokeWidth: strokeWidth ?? 8,
                    backgroundColor: circleColor == null
                        ? Colors.white.withOpacity(bgOpacity)
                        : circleColor?.withOpacity(bgOpacity),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "${(value * 100).round()}%",
              style: textStyle ??
                  kTextButtonStyle.copyWith(
                    fontSize: 15,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
