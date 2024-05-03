import 'package:equatable/equatable.dart';
import 'package:todos_api/todos_api.dart';

enum ProjectStatus {
  initial,
  loading,
  success,
  failure,
}

class ProjectsState extends Equatable {
  const ProjectsState({
    this.projects = const [],
    this.status = ProjectStatus.initial,
  });

  final List<Project> projects;
  final ProjectStatus status;

  @override
  // TODO: implement props
  List<Object?> get props => [projects, status];
}
