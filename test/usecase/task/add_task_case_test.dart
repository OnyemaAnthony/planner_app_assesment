import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:planner_app/repository/task/task_repository.dart';
import 'package:planner_app/usecase/task/add_task_case.dart';
import '../../fakes/task/fake_task_request.dart';
import '../../fakes/task/fake_task_response.dart';
import '../../repository/task/task_repository_test.mocks.dart';

void main(){
  late TaskRepository taskRepository;
  late AddTaskCase addTaskCase;

  test('Add Task  Test- verify that the repo layer is being called', () async {
    taskRepository = MockTaskRepository();
    addTaskCase = AddTaskCase(taskRepository);

    final taskRequest = fakeTaskRequest;
    final taskResponse = fakeTaskResponse;

    when(taskRepository.addTask(taskRequest)).thenAnswer((realInvocation) async=> Right(taskResponse));

    final response = await addTaskCase.call(taskRequest);
    expect(response.isRight(), true);
    verify(taskRepository.addTask(taskRequest));
  });
}