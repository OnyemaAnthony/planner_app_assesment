import '../../models/task/task_request.dart';
import '../../models/task/task_response.dart';

abstract class TaskService{
  Future<TaskResponse>addTask(TaskRequest task);
  Future<TaskRequest>updateTask(TaskRequest task);
  Future<TaskResponse>getAllTasks();
}