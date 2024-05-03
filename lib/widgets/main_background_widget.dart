import 'package:flutter/material.dart';
import 'package:todolistapp/components/shapes/circle_blur_shape.dart';
import 'package:todolistapp/components/shapes/circle_shape.dart';
import 'package:todolistapp/constants.dart';

class MainBackgroundWidget extends StatelessWidget {
  final String assetPath = "assets/images/";
  const MainBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: kLetStartScreenTopRateScale,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 119,
            child: Row(
              children: [
                const Expanded(
                  flex: 104,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: kBackgroundRightRatio,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 98,
                        child: Align(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Image(
                              image: AssetImage(
                                  "${assetPath}Blue stopwatch with pink arrow.png"),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 131,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  flex: 73,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 23,
                                  child: Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: CircleShape(
                                          rad: kRadianExtraSmall,
                                          color: kColorPurple,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 46,
                                        height: 11,
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: CircleShape(
                                          rad: kRadianSmall,
                                          color: kColorBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 23,
                                  child: SizedBox(),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: CircleBlurShape(
                                rad: kRadianNormal,
                                color: kColorYellow,
                                opacity: 0.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 42,
                  child: SizedBox(),
                )
              ],
            ),
          ),
          Expanded(
            flex: 206,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 120,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 80,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Transform.translate(
                                  offset: Offset(-20, 0),
                                  child: CircleBlurShape(
                                    rad: kRadianNormal,
                                    color: kColorGreen,
                                    opacity: 0.8,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image(
                                image: AssetImage("${assetPath}pie chart.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(flex: 73, child: Container()),
                      Expanded(
                          flex: 53,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Transform.translate(
                                offset: Offset(6, 0),
                                child: Image(
                                  image: AssetImage(
                                      "${assetPath}close up of pink coffee cup.png"),
                                ),
                              ),
                              Image(
                                image: AssetImage(
                                    "${assetPath}vase with tulips, glasses and pencil.png"),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                ),
                Expanded(
                  flex: 181,
                  child: Stack(
                    children: [
                      Image(
                          image: AssetImage(
                              "${assetPath}female sitting on the floor with cup in hand and laptop on leg.png")),
                      Align(
                        alignment: Alignment.topRight,
                        child: Transform.translate(
                          offset: Offset(-22, -11),
                          child: Image(
                            image: AssetImage(
                                "${assetPath}Blue desk calendar.png"),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Transform.translate(
                          offset: Offset(-17, -10),
                          child: Image(
                            image: AssetImage(
                                "${assetPath}multicolored smartphone notifications.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 26),
                ),
                Expanded(
                  flex: 42,
                  child: Transform.translate(
                    offset: Offset(10, 0),
                    child: const CircleBlurShape(
                      rad: kRadianNormal - 10,
                      color: kColorDarkBlue,
                      spreadRadius: 5,
                      opacity: 0.8,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 120,
            child: Padding(
              padding: const EdgeInsets.only(top: 31),
              child: Row(
                children: [
                  Expanded(
                    flex: 78,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 209,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: CircleBlurShape(
                                rad: kRadianNormal - 12,
                                color: kColorLightBlue,
                                opacity: 0.3,
                                spreadRadius: 18,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 40, top: 17),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 25),
                                      child: CircleShape(
                                        rad: kRadianSmall,
                                        color: kColorPink,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 15,
                                        left: 30,
                                      ),
                                      child: CircleShape(
                                        rad: kRadianExtraSmall,
                                        color: kColorSecondaryLightBlue,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 116),
                                      child: CircleShape(
                                        rad: kRadianSmall,
                                        color: kColorSecondaryYellow,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: CircleShape(
                            rad: kRadianExtraSmall,
                            color: kColorLightGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 90,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
