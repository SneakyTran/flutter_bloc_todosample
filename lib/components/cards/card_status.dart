import 'package:flutter/material.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/project_status_enum.dart';

class CardStatus extends StatelessWidget {
  const CardStatus({
    super.key,
    required this.status,
    required this.cardColor,
  });
  final ViewProjectStatus status;
  final Color cardColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: cardColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.name,
        style: kTextTitleSimpleCard.copyWith(
          fontSize: 12,
          color: cardColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
