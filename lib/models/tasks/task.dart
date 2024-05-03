import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolistapp/models/project_status_enum.dart';

class Task {
  final String? title;
  final String description;
  final ViewProjectStatus status;
  final DateTime startDate;
  final DateTime endDate;

  Task({
    this.title,
    required this.description,
    required this.status,
    required this.startDate,
    required this.endDate,
  });

  factory Task.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Task(
      description: data?["description"],
      status: data?["status"],
      startDate: (data?["start_date"] as Timestamp).toDate(),
      endDate: (data?["end_date"] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "description": description,
      "status": status,
      "start_date": startDate,
      "end_date": endDate,
    };
  }
}
