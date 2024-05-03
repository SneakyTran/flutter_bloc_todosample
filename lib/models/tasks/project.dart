import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolistapp/models/logo/logo.dart';
import 'package:todolistapp/models/project_status_enum.dart';
import 'package:todolistapp/models/tasks/task.dart';
import 'package:todolistapp/models/tasks/task_group.dart';

class Project {
  Project({
    required this.projectName,
    required this.description,
    this.startDate,
    this.endDate,
    this.logo,
    required this.status,
    this.taskList,
  });
  final String projectName;
  final String description;
  final DateTime? startDate;
  final DateTime? endDate;
  final Logo? logo;
  final ProjectStatusEnum status;
  final List<Task>? taskList;

  factory Project.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Project(
        projectName: data?["project_name"],
        description: data?["description"],
        startDate: (data?["start_date"] as Timestamp).toDate(),
        endDate: (data?["end_date"] as Timestamp).toDate(),
        // logo: data?["logo"] as Logo,
        status: ProjectStatusEnum.values
            .firstWhere((e) => e.toString().split('.')[1] == (data?["status"])),
        taskList: data?["task_list"] is Iterable
            ? List.from(data?["task_list"])
            : null);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "project_name": projectName,
      "description": description,
      if (startDate != null) "start_date": startDate,
      if (endDate != null) "end_date": endDate,
      if (logo != null) "logo": logo,
      "status": status.name,
      if (taskList != null) "task_list": taskList,
    };
  }
}
