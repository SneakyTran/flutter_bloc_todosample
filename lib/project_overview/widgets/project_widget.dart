import 'package:flutter/material.dart';
import 'package:todolistapp/components/cards/card_refactor.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/constants.dart';
import 'package:todos_api/todos_api.dart';
import '../models/models.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({super.key, required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final group =
        GroupStyleEnum.getGroupStyleEnum(project.group) ?? GroupStyleEnum.work;
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: CardRefactor(
        title: project.name,
        content: project.description,
        maxLengthContent: 2,
        cardColor: kCardColorBlue,
        spaceTitleContent: 10,
        icon: IconGroup(
          //TODO: handle load icon here!!
          icon: group.icon,
          iconColor: group.color,
        ),
        paddingCardBottom: 10,
        bottomWidget: ClipRect(
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(10),
            value: 0.7,
            backgroundColor: Colors.white,
            valueColor:
                const AlwaysStoppedAnimation<Color>(kColorLinearProgress),
            minHeight: 7,
          ),
        ),
      ),
    );
  }
}
