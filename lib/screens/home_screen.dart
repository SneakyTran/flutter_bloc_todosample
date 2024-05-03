import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/components/buttons/acting_button_widget.dart';
import 'package:todolistapp/components/buttons/floating_button.dart';
import 'package:todolistapp/components/cards/card_container.dart';
import 'package:todolistapp/components/cards/card_refactor.dart';
import 'package:todolistapp/components/cards/flash_card.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/components/progresses/circle_progress.dart';
import 'package:todolistapp/components/texts/cirlce_text.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/tasks/providers/projects_provider/projects_provider.dart';
import 'package:todolistapp/widgets/background_add_project_widget.dart';
import 'package:todolistapp/project_overview/project_overview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final String name = "Livia vaccaro";
  final String avatarPath = "assets/images/avatar.png";
  late AnimationController controller;
  final double endValue = 0.85;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initData();
  }

  //Handling firebase
  // void initData() async {
  //   final refProjects = _firebaseFirestore
  //       .collection("users/${_auth.currentUser?.email}/task_groups");
  //   var allProjects = <Project>[];
  //   var taskGroups = <TaskGroup>[];
  //   await refProjects.get().then((docSnapshot) async {
  //     if (!docSnapshot.docs.isNotEmpty) {
  //       return;
  //     } else {
  //       //get all projects
  //       await _firebaseFirestore
  //           .collectionGroup("projects")
  //           .withConverter(
  //             fromFirestore: Project.fromFirestore,
  //             toFirestore: (Project project, opts) => project.toFirestore(),
  //           )
  //           .get()
  //           .then((querySnapshot) => allProjects = querySnapshot.docs
  //               .map((doc) => doc.data())
  //               .toList()); //TODO: Handle empty projects
  //
  //       //get task group
  //       await _firebaseFirestore
  //           .collectionGroup("task_groups")
  //           .withConverter(
  //               fromFirestore: TaskGroup.fromFirestore,
  //               toFirestore: (TaskGroup taskGroup, opts) =>
  //                   taskGroup.toFirestoreIncludeProjects())
  //           .get()
  //           .then((querySnapshot) => taskGroups =
  //               querySnapshot.docs.map((doc) => doc.data()).toList());
  //     }
  //   });
  //   for (var taskgroup in taskGroups) {
  //     print(taskgroup.listProjects);
  //   }
  //   TaskGroupProvider().loadData(taskGroups);
  //   ProjectsProvider().loadData(allProjects);
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundAddProjectWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Profile card
                Flexible(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: CardContainer(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child: Image(image: AssetImage(avatarPath)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: FlashCard(
                                  title: "Hello!",
                                  description: name,
                                  titleStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  descriptionStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.notifications,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //today task progress
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        color: kColorButton,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(22),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Stack(
                              children: [
                                Text(
                                  "Your today's tasks almost done",
                                  style: kTextButtonStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: ActingButtonWidget(
                                    title: "View Task",
                                    padding: 0,
                                    buttonHeight: 40,
                                    titleFontSize: 16,
                                    hasBoxShadow: false,
                                    onTap: () {},
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 2,
                                  child: CircleProgress(endValue: 85),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 25,
                                      height: 20,
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        right: 8,
                                      ),
                                      decoration: const BoxDecoration(
                                          color: kColorPurple2,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4))),
                                      child: Transform.translate(
                                        offset: const Offset(5, -10),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Transform.translate(
                                      offset: const Offset(-4, -7),
                                      child: const Text(
                                        "...",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //All task in Progress
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "In Progress",
                                style: kTextStyleTitleHome,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: CircleText(
                                  radius: 20,
                                  color: kColorIconPurple,
                                  opacityBg: 0.1,
                                  text: "4",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: const ProjectOverviewPage(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //Task Groups
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Task Groups",
                                  style: kTextStyleTitleHome,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: CircleText(
                                    radius: 20,
                                    color: kColorIconPurple,
                                    opacityBg: 0.1,
                                    text: "4",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 6,
                          child: const Placeholder(),
                        ),
                        // Flexible(
                        //   flex: 6,
                        //   child: MediaQuery.removePadding(
                        //     removeTop: true,
                        //     context: context,
                        //     child: ListView.separated(
                        //       scrollDirection: Axis.vertical,
                        //       itemBuilder: (BuildContext context, int index) {
                        //         if (index == 0) {
                        //           return Padding(
                        //             padding: const EdgeInsets.only(top: 8),
                        //             child: loadListProgressTaskGroup(
                        //                 context)[index],
                        //           );
                        //         } else {
                        //           return Padding(
                        //             padding: const EdgeInsets.only(top: 18),
                        //             child: loadListProgressTaskGroup(
                        //                 context)[index],
                        //           );
                        //         }
                        //       },
                        //       separatorBuilder: (context, index) => SizedBox(),
                        //       itemCount:
                        //           loadListProgressTaskGroup(context).length,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: FloatingButton(),
          ),
        ],
      ),
    );
  }

  //Load data from Provider with NotifyChange
  // List<Widget> loadListProgressTaskGroup(BuildContext context) => context
  //     .watch<TaskGroupProvider>()
  //     .getListTaskGroup
  //     .map((taskGroup) => GroupTaskCard(
  //           title: taskGroup.groupName,
  //           taskTotalNumber: taskGroup.listProjects?.length ?? 0,
  //           taskProgressValue: Random().nextDouble() * 100,
  //           iconGroup: taskGroup.iconGroup,
  //           color: taskGroup.iconGroup.iconColor,
  //         ))
  //     .toList();

  // List<Widget> loadInProgressProject(BuildContext context) => context
  //     .watch<ProjectsProvider>()
  //     .getListProjects
  //     .map((project) => Padding(
  //           padding: const EdgeInsets.only(left: 12.0),
  //           child: CardRefactor(
  //             title: project.projectName,
  //             content: project.description,
  //             cardColor: kCardColorBlue,
  //             spaceTitleContent: 10,
  //             icon: IconGroup(
  //               //TODO: handle load icon here!!
  //               icon: Icons.work,
  //               iconColor: kColorIconPink,
  //             ),
  //             paddingCardBottom: 10,
  //             bottomWidget: ClipRect(
  //               child: LinearProgressIndicator(
  //                 borderRadius: BorderRadius.circular(10),
  //                 value: 0.7,
  //                 backgroundColor: Colors.white,
  //                 valueColor:
  //                     const AlwaysStoppedAnimation<Color>(kColorLinearProgress),
  //                 minHeight: 7,
  //               ),
  //             ),
  //           ),
  //         ))
  //     .toList();
}
