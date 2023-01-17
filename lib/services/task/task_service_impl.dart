import 'package:planner_app/models/task/task_response.dart';
import 'package:planner_app/services/task/task_service.dart';
import 'package:planner_app/utils/base_api.dart';
import 'package:planner_app/utils/utilities.dart';

import '../../models/task/task_request.dart';

class TaskServiceImpl extends BaseApi implements TaskService {
  TaskServiceImpl() : super();

  @override
  Future<TaskResponse> addTask(TaskRequest task) async {
    String url ='https://firestore.googleapis.com/v1/projects/applaudo-todo-app/databases/(default)/documents/tasks';
    final response = await post(url,body: task.toJson());
     Utilities.showToast('Task added successfully');
    return TaskResponse.fromJson(response);
  }

  @override
  Future<TaskResponse> getAllTasks() async {
    final response = await get(
        'https://firestore.googleapis.com/v1/projects/applaudo-todo-app/databases/(default)/documents/tasks');
    return TaskResponse.fromJson(response);
  }

  @override
  Future<TaskRequest> updateTask(TaskRequest task) async {
    String url = 'https://firestore.googleapis.com/v1/projects/applaudo-todo-app/databases/(default)/documents/tasks/OdFN2DdAlBXPsny3KUAP';

    final response = await patch(url, body: task.toJson());
    print('updated');
    return TaskRequest.fromJson(response);
  }
}
