import 'package:flutter/material.dart';
import 'package:todolistapp/components/shapes/squircle_shape_border.dart';
import 'package:todolistapp/constants.dart';

class ActingButtonWidget extends StatelessWidget {
  const ActingButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.hasIcon = false,
    this.hasBoxShadow = false,
    this.padding = 16,
    this.width = 0,
    this.height = 0,
    this.isActive = false,
    this.titleFontSize = 22,
    this.buttonHeight = 63,
  });
  final String title;
  final VoidCallback onTap;
  final bool hasIcon;
  final bool hasBoxShadow;
  final double padding;
  final double width;
  final double height;
  final bool isActive;
  final double titleFontSize;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding),
        height: buttonHeight,
        child: Container(
          decoration:
              BoxDecoration(boxShadow: hasBoxShadow ? [kButtonBoxShadow] : []),
          child: CustomPaint(
            painter: CurvePainter(
                color: isActive ? kColorButton : kColorButtonInactive),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width, vertical: height),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      title,
                      style: kTextButtonStyle.copyWith(
                          fontSize: titleFontSize,
                          color: !isActive
                              ? kColorButton.withOpacity(0.8)
                              : Colors.white),
                    ),
                  ),
                  if (hasIcon)
                    const Padding(
                      padding: EdgeInsets.only(right: 22),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image(
                          image: AssetImage("assets/images/Arrow - Left.png"),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
