import 'package:flutter/material.dart';
import 'package:todolistapp/constants.dart';

class FlashCard extends StatelessWidget {
  const FlashCard({
    super.key,
    required this.title,
    required this.description,
    this.descriptionStyle,
    this.titleStyle,
    this.spaceTitleDescription,
  });

  final String title;
  final String description;
  final double? spaceTitleDescription;
  final TextStyle? descriptionStyle;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ?? kTitleTextStyle,
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.only(top: spaceTitleDescription ?? 0),
          child: Text(
            description,
            style: descriptionStyle ?? kTextDescriptionSimpleCard,
          ),
        )
      ],
    );
  }
}
