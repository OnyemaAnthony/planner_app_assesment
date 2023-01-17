import 'package:planner_app/di/injection.dart';
import 'package:planner_app/models/task/task_request.dart';
import 'package:planner_app/models/task/task_response.dart';
import 'package:dartz/dartz.dart';
import 'package:planner_app/repository/task/task_repository.dart';
import '../../utils/api_request_failure.dart';
import '../use_case.dart';

class AddTaskCase with  UseCases<Either<ApiRequestFailure, TaskResponse>, TaskRequest>{
  final TaskRepository _repository;

  AddTaskCase(this._repository);
  @override
  Future<Either<ApiRequestFailure, TaskResponse>> call(TaskRequest params) {
    return _repository.addTask(params);
  }
  static AddTaskCase get it =>getIt<AddTaskCase>();
}