import 'package:flutter/foundation.dart';
import 'package:todolistapp/models/tasks/task_group.dart';

class TaskGroupProvider with ChangeNotifier {
  //singleton
  TaskGroupProvider._privateConstructor();
  static final TaskGroupProvider _instance =
      TaskGroupProvider._privateConstructor();
  factory TaskGroupProvider() {
    return _instance;
  }

  List<TaskGroup> _listTaskGroup = [];
  List<TaskGroup> get getListTaskGroup => _listTaskGroup;

  void loadData(List<TaskGroup> listTaskGroup) {
    _listTaskGroup = listTaskGroup;
    notifyListeners();
  }
}
