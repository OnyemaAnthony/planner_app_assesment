import 'package:dartz/dartz.dart';
import 'package:planner_app/models/task/task_response.dart';

import '../../models/task/task_request.dart';
import '../../utils/api_request_failure.dart';

abstract class TaskRepository{
  Future<Either<ApiRequestFailure, TaskResponse>>addTask(TaskRequest task);
  Future<Either<ApiRequestFailure, TaskRequest>>updateTask(TaskRequest task);
  Future<Either<ApiRequestFailure, TaskResponse>>getAllTasks();
}