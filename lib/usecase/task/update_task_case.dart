import 'package:planner_app/di/injection.dart';
import 'package:planner_app/models/task/task_request.dart';
import 'package:dartz/dartz.dart';
import 'package:planner_app/repository/task/task_repository.dart';
import '../../utils/api_request_failure.dart';
import '../use_case.dart';

class UpdateTaskCase with UseCases<Either<ApiRequestFailure, TaskRequest>, TaskRequest>{
  final TaskRepository _taskRepository;

  UpdateTaskCase(this._taskRepository);
  @override
  Future<Either<ApiRequestFailure, TaskRequest>> call(TaskRequest params) {
    return _taskRepository.updateTask(params);
  }
  static UpdateTaskCase get it => getIt<UpdateTaskCase>();
}