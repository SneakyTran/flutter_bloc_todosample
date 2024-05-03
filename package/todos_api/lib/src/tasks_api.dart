import 'models/task.dart';

abstract class TasksApi {
  const TasksApi();
  Stream<List<Task>> getTasks();
  Future<void> saveTasks();
  Future<void> deleteTasks();
  Future<void> updateTasks();
}
