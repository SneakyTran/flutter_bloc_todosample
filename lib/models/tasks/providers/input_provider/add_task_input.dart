import 'package:flutter/foundation.dart';
import 'package:todolistapp/models/tasks/providers/input_provider/input_provider.dart';

class AddTaskInput with ChangeNotifier {
  AddTaskInput._privateConstructor();
  static final AddTaskInput _instance = AddTaskInput._privateConstructor();
  factory AddTaskInput() => _instance;

  late InputProvider inputProvider;
  InputProvider get getInputProvider => inputProvider;
}
