import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolistapp/project_overview/bloc/project_overview_bloc.dart';
import 'package:todolistapp/project_overview/widgets/project_widget.dart';
import 'package:todolistapp/screens/today_tasks_screen.dart';
import 'package:todolistapp/screens/view_projects_screen.dart';

class ProjectOverviewPage extends StatelessWidget {
  const ProjectOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProjectOverviewView();
  }
}

class ProjectOverviewView extends StatelessWidget {
  const ProjectOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectOverviewBloc, ProjectOverViewState>(
      listener: (context, state) {
        print("changes");
      },
      listenWhen: (previous, current) => previous.status != current.status,
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

          return CupertinoScrollbar(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: state.projects
                  .map((project) => ProjectWidget(
                        project: project,
                        onTap: () => Navigator.pushNamed(
                          context,
                          TodayTasksScreen.id,
                        ),
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
