part of 'project_overview_bloc.dart';

enum ProjectOverViewStatus { initial, loading, success, failure }

class ProjectOverViewState extends Equatable {
  const ProjectOverViewState({
    this.projects = const [],
    this.status = ProjectOverViewStatus.initial,
  });
  final List<Project> projects;
  final ProjectOverViewStatus status;
  ProjectOverViewState copyWith({
    List<Project> Function()? projects,
    ProjectOverViewStatus Function()? status,
  }) {
    return ProjectOverViewState(
      projects: projects != null ? projects() : this.projects,
      status: status != null ? status() : this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [projects, status];
}
