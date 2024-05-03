import 'package:flutter/material.dart';
import 'package:todolistapp/components/shapes/circle_blur_shape.dart';
import 'package:todolistapp/constants.dart';

class BackgroundAddProjectWidget extends StatelessWidget {
  const BackgroundAddProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(47, 0),
          child: Align(
            alignment: Alignment.centerRight,
            child: CircleBlurShape(
              rad: kRadianLarge,
              color: kColorYellow,
              opacity: 0.3,
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: CircleBlurShape(
        //     rad: kRadianLarge,
        //     color: kColorGreen,
        //     opacity: 0.3,
        //   ),
        // ),
        Transform.translate(
          offset: Offset(57, 0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CircleBlurShape(
              rad: kRadianNormal - 12,
              color: kColorYellow,
              opacity: 0.2,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(72, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  child: CircleBlurShape(
                    rad: kRadianNormal + 4,
                    color: kColorPurple,
                    opacity: 0.8,
                  ),
                ),
                Expanded(flex: 3, child: SizedBox()),
              ],
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(-29, -120),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: CircleBlurShape(
              rad: kRadianNormal + 26,
              color: kColorBlue,
              opacity: 0.3,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(18, -50),
          child: Align(
            alignment: Alignment.centerRight,
            child: CircleBlurShape(
              rad: kRadianNormal - 10,
              color: kColorPurple,
              opacity: 1,
            ),
          ),
        ),
      ],
    );
  }
}
