import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'json_map.dart';

part 'task.g.dart';

enum TaskStatus {
  todo,
  done,
  inProgress,
}

extension TaskStatusDisplay on TaskStatus {
  String getTaskStatus() {
    switch (this) {
      case TaskStatus.todo:
        return "To do";

      case TaskStatus.done:
        return "Done";

      case TaskStatus.inProgress:
        return "In progress";

      default:
        return "";
    }
  }
}

@JsonSerializable()
class Task extends Equatable {
  Task({
    required this.projectId,
    String? id,
    required this.title,
    required this.description,
    this.status = TaskStatus.todo,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4();
  final String id;
  final String projectId;
  final String title;
  final String description;
  final TaskStatus status;

  Task copyWith({
    String? id,
    String? title,
    String? description,
    TaskStatus? status,
    String? projectId,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      projectId: projectId ?? this.projectId,
    );
  }

  factory Task.fromJson(JsonMap json) => _$TaskFromJson(json);

  JsonMap toJson() => _$TaskToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, description, status];
}
