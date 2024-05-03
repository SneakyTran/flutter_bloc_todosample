import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/cards/card_status.dart';
import 'package:todolistapp/components/cards/flash_card.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/project_status_enum.dart';

class CardProgress extends StatelessWidget {
  const CardProgress({
    super.key,
    required this.title,
    required this.description,
    required this.status,
    required this.time,
    this.type = "type",
    required this.cardStatusWidget,
    required this.iconWidget,
    this.descriptionStyle,
  });
  final String title;
  final String description;
  final ViewProjectStatus status;
  final String time;
  final String type;
  final CardStatus cardStatusWidget;
  final IconGroup iconWidget;
  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlashCard(
                title: title,
                description: description,
                descriptionStyle: descriptionStyle,
              ),
              iconWidget,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    Transform.translate(
                      offset: Offset(-2, 0),
                      child: Icon(
                        Icons.timer,
                        color: kColorButton.withOpacity(0.4),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "10:00 PM",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kColorButton.withOpacity(0.4),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.01,
                      ),
                    ),
                  ],
                ),
              ),
              cardStatusWidget,
            ],
          ),
        ],
      ),
    );
  }
}
