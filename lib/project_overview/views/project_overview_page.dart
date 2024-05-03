import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolistapp/project_overview/bloc/project_overview_bloc.dart';
import 'package:todolistapp/project_overview/widgets/project_widget.dart';
import 'package:todos_repository/todos_repository.dart';

class ProjectOverviewPage extends StatelessWidget {
  const ProjectOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("homepage is building!!");
    return BlocProvider(
      create: (context) => ProjectOverviewBloc(
        projectsRepository: context.read<ProjectsRepository>(),
      )..add(ProjectsOverviewSubscriptionRequested()),
      child: const ProjectOverviewView(),
    );
  }
}

class ProjectOverviewView extends StatelessWidget {
  const ProjectOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectOverviewBloc, ProjectOverViewState>(
      listener: (context, state) {},
      child: BlocBuilder<ProjectOverviewBloc, ProjectOverViewState>(
        builder: (context, state) {
          if (state.status == ProjectOverViewStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //No task
          if (state.projects.isEmpty) {
            if (state.status == ProjectOverViewStatus.success) {
              return const Center(child: Text("There is no task"));
            }
          }
          print("re-render");

          return CupertinoScrollbar(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: state.projects
                  .map((project) => ProjectWidget(
                        project: project,
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
