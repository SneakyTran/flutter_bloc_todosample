import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/components/buttons/acting_button_widget.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/cards/card_status.dart';
import 'package:todolistapp/components/cards/date_picker.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/project_status_enum.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/add_project_input_provider.dart';
import 'package:todolistapp/models/tasks/task.dart';
import 'package:todolistapp/widgets/background_add_project_widget.dart';

class ViewTasksScreen extends StatefulWidget {
  const ViewTasksScreen({super.key});

  static String id = "/view_task";

  @override
  State<ViewTasksScreen> createState() => _ViewTasksScreenState();
}

class _ViewTasksScreenState extends State<ViewTasksScreen> {
  @override
  Widget build(BuildContext context) {
    String _taskName = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Your project"),
      ),
      body: Stack(
        children: [
          BackgroundAddProjectWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardContainer(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Task description",
                          style: kTextDescriptionSimpleCard,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "3 days more",
                            style: kTextTitleSimpleCard.copyWith(
                              color: kColorPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CardStatus(
                        status: ViewProjectStatus.todo,
                        cardColor: kColorOrange),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        children: [
                          CardContainer(
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: "Enter your task"),
                              onChanged: (value) {
                                setState(() {
                                  _taskName = value;
                                });
                              },
                            ),
                          ),
                          const DatePicker(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ActingButtonWidget(
                                title: "Add Task",
                                buttonHeight: 50,
                                onTap: () {
                                  DateTime startDate = context
                                          .read<AddProjectProvider>()
                                          .inputProvider
                                          .inputStartDate ??
                                      DateTime.now();
                                  DateTime endDate = context
                                          .read<AddProjectProvider>()
                                          .inputProvider
                                          .inputEndDate ??
                                      DateTime.now();
                                  final _auth = FirebaseAuth.instance;
                                  if (_auth.currentUser == null) return;
                                  final db = FirebaseFirestore.instance;
                                  final newTask = Task(
                                    description: _taskName,
                                    status: ViewProjectStatus.todo,
                                    startDate: startDate,
                                    endDate: endDate,
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}
