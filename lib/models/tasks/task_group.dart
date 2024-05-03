import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/models/tasks/project.dart';

class TaskGroup {
  TaskGroup({
    this.listProjects,
    required this.groupName,
    required this.iconGroup,
  });
  final String groupName;
  final IconGroup iconGroup;
  final List<Project>? listProjects;

  factory TaskGroup.fromJson(
    Map<String, dynamic>? data,
  ) {
    return TaskGroup(
        groupName: data?["group_name"],
        iconGroup: IconGroup(
          icon: IconData(
            data?["icon"],
            fontFamily:
                'MaterialIcons', // Change to appropriate icon font family
          ),
        ));
  }

  factory TaskGroup.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TaskGroup(
        groupName: data?["group_name"],
        listProjects:
            data?["projects"] is Iterable ? List.from(data?["projects"]) : null,
        iconGroup: IconGroup(
          iconColor: Color(data?["icon_color"]),
          icon: IconData(
            data?["icon"],
            fontFamily:
                'MaterialIcons', // Change to appropriate icon font family
          ),
        ));
  }

  Map<String, dynamic> toFirestore() {
    return {
      "group_name": groupName,
      "icon": iconGroup.icon.codePoint,
      "icon_color": iconGroup.iconColor?.value,
    };
  }

  Map<String, dynamic> toFirestoreIncludeProjects() {
    return {
      if (listProjects != null) "projects": listProjects,
      "group_name": groupName,
      "icon": iconGroup.icon.codePoint,
      "icon_color": iconGroup.iconColor?.value,
    };
  }
}
