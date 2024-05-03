import 'models/models.dart';

abstract class ProjectsApi {
  const ProjectsApi();

  Stream<List<Project>> getProjects();

  Future<void> saveProjects(Project project);
  Future<void> deleteProjects(String projectId);
  Future<void> deleteAllProjects();
  Future<void> saveTask(String projectId, Task task);
  Future<void> changeTaskStatus(
      String projectId, String taskId, TaskStatus status);
}

class ProjectsNotFoundException implements Exception {}

class TaskNotFoundException implements Exception {}
