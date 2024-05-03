import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolistapp/components/buttons/acting_button_widget.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/cards/card_input_updated.dart';
import 'package:todolistapp/components/cards/card_selector.dart';
import 'package:todolistapp/components/cards/date_picker.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/edit_project/bloc/edit_project_bloc.dart';
import 'package:todolistapp/edit_project/bloc/edit_project_event.dart';
import 'package:todolistapp/edit_project/bloc/edit_project_state.dart';
import 'package:todolistapp/edit_project/view/group_selector_page.dart';
import 'package:todolistapp/project_overview/bloc/project_overview_bloc.dart';
import 'package:todolistapp/widgets/background_add_project_widget.dart';
import 'package:todos_api/todos_api.dart';
import 'package:todos_repository/todos_repository.dart';

class EditProjectPage extends StatelessWidget {
  const EditProjectPage({super.key});
  static String id = "/project/edit";

  static Route<void> route({Project? initialProject}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => BlocProvider(
        create: (context) => EditProjectBloc(
          projectsRepository: context.read<ProjectsRepository>(),
          initialProject: initialProject,
        ),
        child: const EditProjectPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProjectBloc, EditProjectState>(
      listener: (context, state) {
        context
            .read<ProjectOverviewBloc>()
            .add(const ProjectsOverviewSubscriptionRequested());
        Navigator.of(context).pop();
      },
      listenWhen: (prev, current) =>
          prev.status != current.status &&
          current.status == EditProjectStatus.success,
      child: const EditProjectView(),
    );
  }
}

class EditProjectView extends StatelessWidget {
  const EditProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((EditProjectBloc bloc) => bloc.state.status);
    // final isNewTask =
    //     context.select((EditProjectBloc bloc) => bloc.state.isNewProject);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Project",
          style: kTextTitle,
        ),
        centerTitle: true,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 22),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Stack(
        children: [
          const BackgroundAddProjectWidget(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const GroupSelectorPage(),
                    _buildCardInput(
                      title: "Project Name",
                      hintText: "Project name",
                      onChange: (value) => context
                          .read<EditProjectBloc>()
                          .add(EditTitleChanged(value)),
                    ),
                    _buildCardInput(
                      title: "Description",
                      hintText: "Write some description here!",
                      maxLinesTextField: 4,
                      onChange: (value) => context
                          .read<EditProjectBloc>()
                          .add(EditDescriptionChanged(value)),
                    ),
                    const DatePicker(),
                    const CardContainer(
                      child: CardSelector(
                        title: "Grocery",
                        description: "Shop",
                        iconPath: "Ellipse 29.png",
                        cardTypeSelector: CardTypeSelector.logo,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    child: ActingButtonWidget(
                      title: "Add Project",
                      isLoading: status.isLoadingOrSuccess,
                      isActive: true,
                      hasBoxShadow: true,
                      onTap: status.isLoadingOrSuccess
                          ? () => {}
                          : () => context.read<EditProjectBloc>().add(
                                const EditProjectSubmitted(),
                              ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCardInput({
    required String title,
    required String hintText,
    int? maxLinesTextField,
    required ValueChanged<String> onChange,
  }) {
    return CardContainer(
      child: CardInput(
        title: title,
        hintText: hintText,
        maxLinesTextField: maxLinesTextField,
        onTextChange: onChange,
      ),
    );
  }
}
