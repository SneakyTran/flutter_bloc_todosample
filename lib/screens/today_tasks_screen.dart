import 'package:flutter/material.dart';
import 'package:todolistapp/components/buttons/acting_button_widget.dart';
import 'package:todolistapp/components/buttons/floating_button.dart';
import 'package:todolistapp/components/cards/card_date.dart';
import 'package:todolistapp/components/cards/card_progress.dart';
import 'package:todolistapp/components/cards/card_status.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/project_status_enum.dart';
import 'package:todolistapp/models/tasks/task.dart';
import 'package:todolistapp/ultilities/date_time.dart';
import 'package:todolistapp/widgets/background_add_project_widget.dart';

class TodayTasksScreen extends StatefulWidget {
  TodayTasksScreen({super.key});
  static String id = "/view_project";

  @override
  State<TodayTasksScreen> createState() => _TodayTasksScreenState();
}

class _TodayTasksScreenState extends State<TodayTasksScreen> {
  final List<Task> _dataMock = [
    Task(
      title: "Grocery shopping app design",
      description: "Market Research",
      status: ViewProjectStatus.done,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
    Task(
      title: "Grocery shopping app design",
      description: "Market Research",
      status: ViewProjectStatus.inProgress,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
    Task(
      title: "Grocery shopping app design",
      description: "Market Research",
      status: ViewProjectStatus.todo,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
    ),
  ];
  int _selectedDayIndex = 0;
  int _selectedProjectStatusIndex = 0;
  final int _numberOfNextDay = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today's Tasks",
          style: kTextTitle,
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Stack(
        children: [
          const BackgroundAddProjectWidget(),
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _numberOfNextDay,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDayIndex = index;
                      });
                    },
                    child: CardDate(
                      dateTime: DateTime.now().add(
                        Duration(days: index),
                      ),
                      isActiveCard: index == _selectedDayIndex,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ViewProjectStatus.values.length,
                        itemBuilder: (context, index) => getListStatus(
                          () {
                            setState(() {
                              _selectedProjectStatusIndex = index;
                            });
                          },
                          _selectedProjectStatusIndex,
                        )[index],
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 5,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: buildCardProgress(),
                  )),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingButton(),
          ),
        ],
      ),
    );
  }

  List<CardProgress> buildCardProgress() => _dataMock
      .map((data) => CardProgress(
            title: data.title ?? "",
            description: data.description,
            status: ViewProjectStatus.inProgress,
            time: DateTimeLibraryHelper.instance.getDate(data.endDate),
            descriptionStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            cardStatusWidget: CardStatus(
              status: ViewProjectStatus.done,
              cardColor: kColorButton.withOpacity(0.7),
            ),
            iconWidget: IconGroup(
              icon: Icons.work,
              iconColor: kColorIconPink,
              iconSize: 16,
            ),
          ))
      .toList();

  List<Widget> getListStatus(
          VoidCallback onTap, int selectedProjectStatusIndex) =>
      ViewProjectStatus.values
          .asMap()
          .map((index, projectStatus) => MapEntry(
              index,
              ActingButtonWidget(
                title: projectStatus.name,
                isActive: selectedProjectStatusIndex == index,
                padding: 6,
                width: 30,
                titleFontSize: 16,
                hasBoxShadow: false,
                onTap: onTap,
              )))
          .values
          .toList();
}
