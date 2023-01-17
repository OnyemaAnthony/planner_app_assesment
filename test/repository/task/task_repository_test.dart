import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:planner_app/repository/task/task_repo_impl.dart';
import 'package:planner_app/repository/task/task_repository.dart';
import 'package:planner_app/services/task/task_service.dart';
import '../../fakes/task/fake_task_request.dart';
import '../../fakes/task/fake_task_response.dart';
import 'task_repository_test.mocks.dart';

@GenerateMocks([TaskService,TaskRepository])
void main() {

  late TaskRepository taskRepository;
  late TaskService taskService;
  group('Task test', (){

    test('Add Task test - verify that the  service layer is called', ()async{


      taskService = MockTaskService();
      taskRepository = TaskRepositoryImpl(taskService);

      final task = fakeTaskRequest;
      final fakeTask = fakeTaskResponse;

      when(taskService.addTask(task)).thenAnswer((realInvocation)async =>fakeTask);
      final expected = await taskRepository.addTask(task);
      expect(expected.isRight(),true);

      final result = expected.fold((l) {}, (r) =>r);
      verify(taskService.addTask(task));
    });


    test('GetAll Task Test - verify if the service layer is called', () async {
      taskService = MockTaskService();
      taskRepository = TaskRepositoryImpl(taskService);

      final task = fakeTaskResponse;

      when(taskService.getAllTasks()).thenAnswer((realInvocation)async =>task);

      final expected = await taskRepository.getAllTasks();
      expect(expected.isRight(), true);

      final result = expected.fold((l) {}, (r) => r);

      verify(taskService.getAllTasks());
      expect(task.documents!.length, result!.documents!.length);

    });
    test('Update Task - verify service layer is being called', () async {
      taskService = MockTaskService();
      taskRepository = TaskRepositoryImpl(taskService);

      final taskRequest = fakeTaskRequest;


      when(taskService.updateTask(taskRequest)).thenAnswer((realInvocation) async=> taskRequest);

      final expected = await taskRepository.updateTask(taskRequest);

      expect(expected.isLeft(), false);
      final result = expected.fold((l){}, (r) => r);

      verify(taskService.updateTask(taskRequest));
      expect(taskRequest.field, result!.field);
    });
  });
}