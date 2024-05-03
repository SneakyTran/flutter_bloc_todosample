part of 'project_overview_bloc.dart';

sealed class ProjectOverviewEvent extends Equatable {
  const ProjectOverviewEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

final class ProjectsOverviewSubscriptionRequested extends ProjectOverviewEvent {
  const ProjectsOverviewSubscriptionRequested();
}
