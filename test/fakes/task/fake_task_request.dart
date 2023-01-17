import 'package:planner_app/models/task/task_request.dart';

Map<String,dynamic>taskRequest = {
  "fields": {
    "date": {
      "integerValue": "1664072803"
    },
    "categoryId": {
      "stringValue": " DDQeCPpZATcLfV9U3I0v"
    },
    "name": {
      "stringValue": "test123"
    },
    "isCompleted": {
      "booleanValue": false
    }
  }
};
final fakeTaskRequest = TaskRequest.fromJson(taskRequest);