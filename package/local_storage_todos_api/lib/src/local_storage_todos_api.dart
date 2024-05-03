import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_api/todos_api.dart';

class LocalStorageTodosApi extends ProjectsApi {
  final _todoStreamController = BehaviorSubject<List<Project>>.seeded(const []);
  LocalStorageTodosApi({required SharedPreferences plugin}) : _plugin = plugin {
    _init();
  }

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);
  final SharedPreferences _plugin;

  static const kTodosCollectionKey = '__todos_collection_key__';

  void _init() {
    final todoJson = _getValue(kTodosCollectionKey);
    if (todoJson != null && todoJson.isNotEmpty) {
      final projects =
          List<Map<dynamic, dynamic>>.from(jsonDecode(todoJson) as List)
              .map((jsonMap) =>
                  Project.fromJson(Map<String, dynamic>.from(jsonMap)))
              .toList();
      _todoStreamController.add(projects);
    } else {
      _todoStreamController.add(const []);
    }
  }

  @override
  Stream<List<Project>> getProjects() {
    _todoStreamController.asBroadcastStream(
      onListen: (controller) {},
    );
    return _todoStreamController.asBroadcastStream();
  }

  @override
  Future<void> saveProjects(Project project) async {
    // TODO: implement saveProjects
    final projects = [..._todoStreamController.value];
    final projectIndex = projects.indexWhere((p) => p.id == project.id);
    if (projectIndex >= 0) {
      //TODO: Handle update project
      projects[projectIndex] = project;
    } else {
      //TODO: Handle Create New Project
      projects.add(project);
    }
    _todoStreamController.add(projects);
    return _setValue(kTodosCollectionKey, json.encode(projects));
  }

  @override
  Future<void> deleteProjects(String id) async {
    // TODO: implement deleteProjects
    final projects = [..._todoStreamController.value];
    final indexFound = projects.indexWhere((p) => p.id == id);
    if (indexFound == -1) {
      throw ProjectsNotFoundException();
    } else {
      projects.removeAt(indexFound);
      _todoStreamController.add(projects);
    }
    return _setValue(kTodosCollectionKey, json.encode(projects));
  }

  @override
  Future<void> deleteAllProjects() {
    // TODO: implement deleteAllProjects
    return _setValue(kTodosCollectionKey, "");
  }

  @override
  Future<void> saveTask(String projectId, Task task) {
    // TODO: implement addTask
    final projects = [..._todoStreamController.value];
    final indexFound = projects.indexWhere((p) => p.id == projectId);
    if (indexFound == -1) {
      throw ProjectsNotFoundException();
    } else {
      //TODO: Handle add new task
      final tasks = [...projects[indexFound].tasks];
      final taskFoundIndex =
          tasks.indexWhere((element) => element.id == task.id);
      if (taskFoundIndex == -1) {
        tasks.add(task);
      } else {
        tasks[taskFoundIndex] = task;
      }
    }
    _todoStreamController.add(projects);
    return _setValue(kTodosCollectionKey, json.encode(projects));
  }

  @override
  Future<void> changeTaskStatus(
      String projectId, String taskId, TaskStatus status) {
    // TODO: implement changeTaskStatus
    throw UnimplementedError();
  }
}
