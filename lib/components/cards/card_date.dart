import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolistapp/constants.dart';

class CardDate extends StatelessWidget {
  const CardDate(
      {super.key, required this.dateTime, this.isActiveCard = false});
  final bool isActiveCard;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    TextStyle cardTextStyle = isActiveCard
        ? kTextDescriptionSimpleCard.copyWith(color: Colors.white)
        : kTextDescriptionSimpleCard;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        decoration: kCardBoxDecoration.copyWith(
            color: isActiveCard ? kColorButton : Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              DateFormat("MMM").format(dateTime).toString(),
              style: cardTextStyle,
            ),
            Text(
              dateTime.day.toString().padLeft(2, "0"),
              style: cardTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              DateFormat("E").format(dateTime).toString(),
              style: cardTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
