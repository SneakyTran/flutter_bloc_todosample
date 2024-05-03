import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:todolistapp/edit_project/bloc/edit_project_event.dart';
import 'package:todolistapp/edit_project/bloc/edit_project_state.dart';
import 'package:todos_api/todos_api.dart';
import 'package:todos_repository/todos_repository.dart';

class EditProjectBloc extends Bloc<EditProjectEvent, EditProjectState> {
  EditProjectBloc({
    required ProjectsRepository projectsRepository,
    required Project? initialProject,
  })  : _projectsRepository = projectsRepository,
        super(
          EditProjectState(
            initialProject: initialProject,
            title: initialProject?.name ?? '',
            description: initialProject?.description ?? '',
            group: initialProject?.group ?? "",
            logo: initialProject?.logo ?? "",
            startDate: DateTime.now(),
            endDate: DateTime.now(),
          ),
        ) {
    on<EditTitleChanged>(_onTitleChanged);
    on<EditDescriptionChanged>(_onDescriptionChanged);
    on<EditStartDateChanged>(_onStartDateChanged);
    on<EditEndDateChanged>(_onEndDateChanged);
    on<EditGroupChanged>(_onGroupChanged);
    on<EditLogoChanged>(_onLogoChanged);
    on<EditProjectSubmitted>(_onSubmitted);
  }

  final ProjectsRepository _projectsRepository;

  void _onTitleChanged(
    EditTitleChanged event,
    Emitter<EditProjectState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _onDescriptionChanged(
      EditDescriptionChanged event, Emitter<EditProjectState> emit) {
    emit(state.copyWith(description: event.description));
  }

  void _onStartDateChanged(
      EditStartDateChanged event, Emitter<EditProjectState> emit) {
    emit(state.copyWith(startDate: event.startDate));
  }

  void _onEndDateChanged(
      EditEndDateChanged event, Emitter<EditProjectState> emit) {
    emit(state.copyWith(startDate: event.endDate));
  }

  void _onGroupChanged(EditGroupChanged event, Emitter<EditProjectState> emit) {
    emit(state.copyWith(group: event.group));
  }

  void _onLogoChanged(EditLogoChanged event, Emitter<EditProjectState> emit) {
    emit(state.copyWith(logo: event.logo));
  }

  Future<void> _onSubmitted(
      EditProjectSubmitted event, Emitter<EditProjectState> emit) async {
    //TODO: Handle loading
    emit(state.copyWith(status: EditProjectStatus.loading));
    await Future.delayed(const Duration(seconds: 2));

    final project = (state.initialProject ??
            Project(
              name: '',
              description: '',
              startDate: DateTime.now(),
              endDate: DateTime.now(),
              group: 'work',
              logo: '',
            ))
        .copyWith(
      name: state.title,
      description: state.description,
      startDate: state.startDate,
      endDate: state.endDate,
      group: state.group.isEmpty ? "work" : state.group,
    );

    try {
      await _projectsRepository.saveProject(project);
      emit(state.copyWith(status: EditProjectStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EditProjectStatus.failure));
    }
  }
}
