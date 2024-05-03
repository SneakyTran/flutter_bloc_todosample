import 'package:flutter/foundation.dart';
import 'package:todolistapp/models/tasks/task_group.dart';

class InputProvider {
  String? projectNameField;
  String? projectDescriptionField;
  DateTime? inputStartDate;
  DateTime? inputEndDate;
  TaskGroup taskGroup;

  InputProvider({
    this.projectNameField,
    this.projectDescriptionField,
    this.inputStartDate,
    this.inputEndDate,
    required this.taskGroup,
  });

  // Setter method for projectNameField
  void setProjectNameField(String newName) {
    projectNameField = newName;
  }

  // Setter method for projectDescriptionField
  void setProjectDescriptionField(String newDescription) {
    projectDescriptionField = newDescription;
  }

  // Setter method for inputStartDate
  void setInputStartDate(DateTime newInputStartDate) {
    inputStartDate = newInputStartDate;
  }

  // Setter method for inputEndDate
  void setInputEndDate(DateTime newInputEndDate) {
    inputEndDate = newInputEndDate;
  }

  void setTaskGroup(TaskGroup newTaskGroup) {
    taskGroup = newTaskGroup;
  }
}

enum InputDateType { start, end }

enum InputTextFieldType { name, description }
