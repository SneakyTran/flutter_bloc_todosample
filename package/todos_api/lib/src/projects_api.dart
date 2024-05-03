import 'models/project.dart';

abstract class ProjectsApi {
  const ProjectsApi();

  Stream<List<Project>> getProjects();

  Future<void> saveProjects(Project project);
  Future<void> deleteProjects(String projectId);
  Future<void> deleteAllProjects();
}

class ProjectsNotFoundException implements Exception {}
