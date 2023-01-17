import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:planner_app/repository/task/task_repository.dart';
import 'package:planner_app/usecase/task/update_task_case.dart';
import '../../fakes/task/fake_task_request.dart';
import '../../repository/task/task_repository_test.mocks.dart';

void main(){
  late TaskRepository taskRepository;
  late UpdateTaskCase updateTaskCase;

  test('Update task  Test- verify that the repo layer is being called', () async {
    taskRepository = MockTaskRepository();
    updateTaskCase = UpdateTaskCase(taskRepository);

    final taskRequest = fakeTaskRequest;

    when(taskRepository.updateTask(taskRequest)).thenAnswer((realInvocation) async=> Right(taskRequest));

    final response = await updateTaskCase.call(taskRequest);
    expect(response.isRight(), true);
    verify(taskRepository.updateTask(taskRequest));
  });

}