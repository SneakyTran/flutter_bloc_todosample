import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/constants.dart';

class CardRefactor extends StatelessWidget {
  const CardRefactor({
    super.key,
    required this.title,
    required this.content,
    this.cardColor,
    this.contentType,
    required this.icon,
    required this.bottomWidget,
    this.spaceTitleContent,
    this.paddingCardBottom,
    this.cardPadding,
    this.maxLengthContent,
  });
  final String title;
  final String content;
  final Color? cardColor;
  final ContentType? contentType;
  final int? maxLengthContent;
  final IconGroup icon;
  final double? spaceTitleContent;
  final double? paddingCardBottom;
  final EdgeInsetsGeometry? cardPadding;
  final Widget bottomWidget;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        width: 230,
        padding: cardPadding ?? EdgeInsets.zero,
        backgroundColor: cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: kTitleTextStyle,
                ),
                icon,
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: spaceTitleContent ?? 0),
              child: Text(
                "$content\n",
                style: kContentTextStyle.copyWith(height: 1),
                maxLines: maxLengthContent,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddingCardBottom ?? 0),
              child: bottomWidget,
            ),
          ],
        ));
  }
}

enum ContentType { text, inputText }
