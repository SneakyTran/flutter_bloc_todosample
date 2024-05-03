import 'package:equatable/equatable.dart';
import 'package:todos_api/todos_api.dart';

enum EditProjectStatus {
  initial,
  loading,
  success,
  failure,
}

extension editProjectStatusX on EditProjectStatus {
  bool get isLoadingOrSuccess =>
      [EditProjectStatus.loading, EditProjectStatus.success].contains(this);
}

final class EditProjectState extends Equatable {
  const EditProjectState({
    this.status = EditProjectStatus.initial,
    this.initialProject,
    this.title = '',
    this.description = '',
    required this.startDate,
    required this.endDate,
    this.group = '',
    this.logo = '',
  });

  final EditProjectStatus status;
  final Project? initialProject;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String group;
  final String logo;

  //check is new project or not
  bool get isNewProject => initialProject == null;

  EditProjectState copyWith({
    EditProjectStatus? status,
    Project? initialProject,
    String? title,
    String? description,
    String? group,
    String? logo,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return EditProjectState(
      initialProject: initialProject ?? this.initialProject,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      group: group ?? this.group,
      logo: logo ?? this.logo,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        initialProject,
        title,
        description,
        status,
        group,
        logo,
      ];
}
