import "package:todos_api/todos_api.dart";

class ProjectsRepository {
  const ProjectsRepository({
    required ProjectsApi projectsApi,
  }) : _projectsApi = projectsApi;
  final ProjectsApi _projectsApi;

  //Provides a stream of projects
  Stream<List<Project>> getListProject() => _projectsApi.getProjects();
  Future<void> saveProject(Project project) =>
      _projectsApi.saveProjects(project);
  Future<void> deleteProject(String id) => _projectsApi.deleteProjects(id);
  Future<void> deleteAllProject() => _projectsApi.deleteAllProjects();
  Future<void> addTask(String projectId, Task task) =>
      _projectsApi.saveTask(projectId, task);
  Future<void> changeTaskStatus(
          String projectId, String taskId, TaskStatus status) =>
      _projectsApi.changeTaskStatus(projectId, taskId, status);
}
