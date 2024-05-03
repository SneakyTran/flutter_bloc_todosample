import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todos_api/todos_api.dart';
import 'package:todos_repository/todos_repository.dart';

part 'project_overview_event.dart';
part 'project_overview_state.dart';

class ProjectOverviewBloc
    extends Bloc<ProjectOverviewEvent, ProjectOverViewState> {
  ProjectOverviewBloc({required ProjectsRepository projectsRepository})
      : _projectsRepository = projectsRepository,
        super(const ProjectOverViewState()) {
    on<ProjectsOverviewSubscriptionRequested>(_onSubscriptionRequested);
  }

  final ProjectsRepository _projectsRepository;

  Future<void> _onSubscriptionRequested(
      ProjectOverviewEvent event, Emitter<ProjectOverViewState> emit) async {
    emit(state.copyWith(status: () => ProjectOverViewStatus.loading));
    // await _projectsRepository.deleteAllProject();
    await Future.delayed(const Duration(seconds: 1));
    await emit.forEach<List<Project>>(
      _projectsRepository.getListProject(),
      onData: (projects) => state.copyWith(
        status: () => ProjectOverViewStatus.success,
        projects: () => projects,
      ),
      onError: (_, __) => state.copyWith(
        status: () => ProjectOverViewStatus.failure,
      ),
    );
  }
}
