
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:planner_app/repository/task/task_repository.dart';
import 'package:planner_app/usecase/task/get_all_task_case.dart';
import '../../fakes/task/fake_task_response.dart';
import '../../repository/task/task_repository_test.mocks.dart';

void main(){

  late TaskRepository taskRepository;
  late GetAllTaskCase getAllTaskCase;


  test('Get all Task - verify that the repo layer is being called', () async {
    taskRepository = MockTaskRepository();
    getAllTaskCase = GetAllTaskCase(taskRepository);


    final tasks = fakeTaskResponse;

    when(taskRepository.getAllTasks()).thenAnswer((realInvocation) async=> Right(tasks));

    final response = await getAllTaskCase.call();
    expect(response.isRight(), true);

    verify(taskRepository.getAllTasks());
  });
}