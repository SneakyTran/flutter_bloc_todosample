import 'package:flutter/material.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/components/progresses/circle_progress.dart';
import 'package:todolistapp/constants.dart';

class GroupTaskCard extends StatelessWidget {
  const GroupTaskCard({
    super.key,
    required this.title,
    required this.taskTotalNumber,
    required this.taskProgressValue,
    required this.color,
    required this.iconGroup,
  });

  final String title;
  final int taskTotalNumber;
  final double taskProgressValue;
  final Color? color;
  final IconGroup iconGroup;

  @override
  Widget build(BuildContext context) {
    iconGroup.iconSize = 25;
    return CardContainer(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              iconGroup,
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: kTextTitleSimpleCard.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "$taskTotalNumber Tasks",
                      style: kTextDescriptionSimpleCard.copyWith(
                        fontSize: 14,
                        color: const Color(0xFF787484),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: CircleProgress(
              endValue: taskProgressValue,
              circleColor: color ?? kColorIconPink,
              width: 55,
              strokeWidth: 5,
              bgOpacity: 0.2,
              textStyle: kTextButtonStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
