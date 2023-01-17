
import 'package:planner_app/di/injection.dart';
import 'package:planner_app/models/task/task_response.dart';
import 'package:dartz/dartz.dart';
import 'package:planner_app/repository/task/task_repository.dart';
import '../../utils/api_request_failure.dart';
import '../use_case.dart';

class GetAllTaskCase with NoParamUseCases<Either<ApiRequestFailure,TaskResponse>>{
  final TaskRepository taskRepository;

  GetAllTaskCase(this.taskRepository);
  @override
  Future<Either<ApiRequestFailure, TaskResponse>> call() {
   return taskRepository.getAllTasks();
  }
  static GetAllTaskCase get it => getIt<GetAllTaskCase>();
}