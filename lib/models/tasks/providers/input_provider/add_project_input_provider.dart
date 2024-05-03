import 'package:flutter/material.dart';
import 'package:todolistapp/components/icons/icon_group.dart';
import 'package:todolistapp/constants.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/input_login_provider.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/input_provider.dart';
import 'package:todolistapp/models/tasks/task_group.dart';

class AddProjectProvider with ChangeNotifier {
  // Private constructor to prevent instantiation from outside
  AddProjectProvider._privateConstructor() {
    _inputProvider = InputProvider(
      inputStartDate: DateTime.now(),
      inputEndDate: DateTime.now(),
      taskGroup: TaskGroup(
        groupName: "Work",
        iconGroup: IconGroup(
          icon: Icons.work,
          iconColor: kColorPink,
        ),
      ),
    );
    _userLoginProvider = UserLoginProvider(email: "", password: "");
  }

  // Singleton instance variable
  static final AddProjectProvider _instance =
      AddProjectProvider._privateConstructor();

  // Factory method to provide access to the singleton instance
  factory AddProjectProvider() {
    return _instance;
  }

  late InputProvider _inputProvider;

  InputProvider get inputProvider => _inputProvider;

  void addInputFieldProvider(
      String projectInputField, InputTextFieldType inputTextFieldType) {
    inputTextFieldType == InputTextFieldType.name
        ? inputProvider.setProjectNameField(projectInputField)
        : inputProvider.setProjectDescriptionField(projectInputField);
    notifyListeners();
  }

  void addDatePicker(DateTime? inputDate, InputDateType inputDateType) {
    inputDateType == InputDateType.start
        ? inputProvider.setInputStartDate(inputDate ?? DateTime.now())
        : inputProvider.setInputEndDate(inputDate ?? DateTime.now());
    notifyListeners();
  }

  void addTaskGroup(TaskGroup taskGroup) {
    inputProvider.setTaskGroup(taskGroup);
    notifyListeners();
  }

  late UserLoginProvider _userLoginProvider;
  UserLoginProvider get userLoginProvider => _userLoginProvider;

  void addUserLoginProvider(String email, String password) {
    if (email.isNotEmpty) _userLoginProvider.setEmail(email);
    if (password.isNotEmpty) _userLoginProvider.setPassword(password);
    notifyListeners();
  }
}
