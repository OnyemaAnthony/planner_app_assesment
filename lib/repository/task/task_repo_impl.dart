import 'package:dartz/dartz.dart';
import 'package:planner_app/models/task/task_response.dart';
import 'package:planner_app/repository/task/task_repository.dart';
import 'package:planner_app/services/task/task_service.dart';
import 'package:planner_app/utils/api_interceptor.dart';
import 'package:planner_app/utils/api_request_failure.dart';

import '../../models/task/task_request.dart';

class TaskRepositoryImpl implements TaskRepository{
  final TaskService _taskService;

  TaskRepositoryImpl(this._taskService): super();

  @override
  Future<Either<ApiRequestFailure, TaskResponse>> addTask(TaskRequest task) {
    return apiInterceptor(() => _taskService.addTask(task));

  }

  @override
  Future<Either<ApiRequestFailure,TaskResponse>> getAllTasks() {
    return apiInterceptor(() => _taskService.getAllTasks());
  }

  @override
  Future<Either<ApiRequestFailure, TaskRequest>> updateTask(TaskRequest task) {
    return apiInterceptor(() => _taskService.updateTask(task));
  }

}