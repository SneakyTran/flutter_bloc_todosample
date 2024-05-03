import 'package:flutter/cupertino.dart';
import 'package:todolistapp/models/tasks/project.dart';

class ProjectsProvider with ChangeNotifier {
  ProjectsProvider._privateConstructor();
  static final ProjectsProvider _instance =
      ProjectsProvider._privateConstructor();
  factory ProjectsProvider() {
    return _instance;
  }

  late List<Project> _listProjects = [];
  List<Project> get getListProjects => _listProjects;

  void addNewProject(Project newProject) {
    _listProjects.add(newProject);
    notifyListeners();
  }

  void loadData(List<Project> initProjects) {
    _listProjects = initProjects;
    notifyListeners();
  }
}
