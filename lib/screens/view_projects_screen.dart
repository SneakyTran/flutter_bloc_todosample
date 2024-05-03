import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/components/buttons/acting_button_widget.dart';
import 'package:todolistapp/components/buttons/floating_button.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/tasks/project.dart';
import 'package:todolistapp/models/tasks/providers/projects_provider/projects_provider.dart';
import 'package:todolistapp/models/tasks/providers/task_group_provider/task_group_provider.dart';
import 'package:todolistapp/widgets/background_add_project_widget.dart';

class ViewProjectsScreen extends StatefulWidget {
  const ViewProjectsScreen({super.key});
  static String id = "view_projects";

  @override
  State<ViewProjectsScreen> createState() => _ViewProjectsScreenState();
}

class _ViewProjectsScreenState extends State<ViewProjectsScreen> {
  late int _selectedTaskGroup = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Workspaces",
          style: kTextStyleTitleHome.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          const BackgroundAddProjectWidget(),
          Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: context
                            .watch<TaskGroupProvider>()
                            .getListTaskGroup
                            .length +
                        1,
                    itemBuilder: (BuildContext context, int index) =>
                        getListTaskGroup(
                          context,
                          () {
                            setState(() => _selectedTaskGroup = index);
                          },
                          _selectedTaskGroup,
                        )[index]),
              ),
              Expanded(
                flex: 11,
                child: Column(
                  children: context
                      .watch<ProjectsProvider>()
                      .getListProjects
                      .map((project) => CardProject(project))
                      .toList(),
                ),
              ),
            ],
          ),
          Align(alignment: Alignment.bottomLeft, child: FloatingButton()),
        ],
      ),
    );
  }

  Widget CardProject(Project project) => CardContainer(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconGroup(
                    icon: Icons.person,
                    iconColor: kColorPurple,
                    iconSize: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.projectName,
                          style: kTextDescriptionSimpleCard,
                        ),
                        Text(
                            "${project.taskList == null ? 0 : project.taskList?.length} Sub Tasks"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image(image: AssetImage("assets/images/Ellipse 29.png")),
        ],
      ));

  List<Widget> getListTaskGroup(
    BuildContext context,
    VoidCallback onTap,
    int selectedIndex,
  ) {
    late List<Widget> _taskGroupWidgets = [];
    _taskGroupWidgets.add(ActingButtonWidget(
      title: "All",
      padding: 6,
      width: 30,
      titleFontSize: 16,
      hasBoxShadow: false,
      isActive: 0 == selectedIndex,
      onTap: onTap,
    ));

    _taskGroupWidgets.insertAll(
        1,
        context
            .watch<TaskGroupProvider>()
            .getListTaskGroup
            .asMap()
            .map((index, taskGroup) => MapEntry(
                index + 1,
                ActingButtonWidget(
                  title: taskGroup.groupName,
                  padding: 6,
                  width: 30,
                  titleFontSize: 16,
                  hasBoxShadow: false,
                  isActive: index + 1 == selectedIndex,
                  onTap: onTap,
                )))
            .values
            .toList());

    return _taskGroupWidgets;
  }
}
