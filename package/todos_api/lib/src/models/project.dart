import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:todos_api/src/models/json_map.dart';
import 'package:uuid/uuid.dart';
import 'task.dart';

part 'project.g.dart';

enum Group { work, personal, study }

enum Logo { shop, storage }

@JsonSerializable()
class Project extends Equatable {
  Project({
    String? id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.group,
    required this.logo,
    List<Task>? tasks,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4(),
        tasks = [];
  final String? id;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String group;
  final String logo;
  final List<Task> tasks;

  Project copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? group,
    String? logo,
  }) {
    return Project(
      name: name ?? this.name,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      group: group ?? this.group,
      logo: logo ?? this.logo,
    );
  }

  factory Project.fromJson(JsonMap json) => _$ProjectFromJson(json);

  JsonMap toJson() => _$ProjectToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        description,
        startDate,
        endDate,
        group,
        logo,
      ];
}
