import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/components/buttons/acting_button_widget.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/cards/card_input.dart';
import 'package:todolistapp/components/cards/card_selector.dart';
import 'package:todolistapp/components/cards/date_picker.dart';
import 'package:todolistapp/components/cards/dropdown_card.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/project_status_enum.dart';
import 'package:todolistapp/models/tasks/project.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/add_project_input_provider.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/input_provider.dart';
import 'package:todolistapp/models/tasks/task_group.dart';
import 'package:todolistapp/screens/home_screen.dart';
import 'package:todolistapp/widgets/background_add_project_widget.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key});
  static String id = "/add_project";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Add Project",
          style: kTextTitle,
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Consumer<AddProjectProvider>(
        builder:
            (BuildContext context, AddProjectProvider value, Widget? child) =>
                Stack(
          children: [
            const BackgroundAddProjectWidget(),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      DropdownCard(title: "Task Group"),
                      _buildCardInput(
                        title: "Project Name",
                        hintText: "Project name",
                      ),
                      _buildCardInput(
                        title: "Description",
                        hintText: "Write some description here!",
                        maxLinesTextField: 4,
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
                        isActive: true,
                        hasBoxShadow: true,
                        onTap: () {
                          addNewProjectFn(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCardInput({
    required String title,
    required String hintText,
    int? maxLinesTextField,
  }) {
    return CardContainer(
      child: CardInput(
        title: title,
        hintText: hintText,
        maxLinesTextField: maxLinesTextField,
      ),
    );
  }

  void addNewProjectFn(BuildContext context) async {
    try {
      final _auth = FirebaseAuth.instance;
      if (_auth.currentUser == null) return;
      InputProvider inputProvider =
          context.read<AddProjectProvider>().inputProvider;
      final db = FirebaseFirestore.instance;
      final project = Project(
        projectName: inputProvider.projectNameField ?? "",
        description: inputProvider.projectDescriptionField ?? "",
        startDate: inputProvider.inputStartDate,
        endDate: inputProvider.inputEndDate,
        status: ProjectStatusEnum.created,
      );
      final taskGroupDoc = db
          .collection("users/${_auth.currentUser?.email}/task_groups")
          .doc(inputProvider.taskGroup.groupName);
      taskGroupDoc.get().then((docSnapshot) async {
        final projectDoc = taskGroupDoc.collection("projects").doc();
        if (!docSnapshot.exists) {
          //Check task group is existed?
          TaskGroup taskGroup = TaskGroup(
            iconGroup: inputProvider.taskGroup.iconGroup,
            groupName: inputProvider.taskGroup.groupName,
          );
          await taskGroupDoc
              .withConverter(
                fromFirestore: TaskGroup.fromFirestore,
                toFirestore: (TaskGroup taskGroup, opts) =>
                    taskGroup.toFirestore(),
              )
              .set(taskGroup);
        }
        await projectDoc
            .withConverter(
              fromFirestore: Project.fromFirestore,
              toFirestore: (Project project, opts) => project.toFirestore(),
            )
            .set(project);
      }).catchError((error) {
        //TODO: Handle error here!!!
        print(error);
      });
      // print(docRef);a
      // print(project);
      Navigator.pushNamed(context, HomeScreen.id);
    } catch (e) {}
  }
}
