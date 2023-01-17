import 'package:planner_app/models/category/category_request.dart';

Map<String,dynamic>categoryRequest ={
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

final fakeCategoryRequest = CategoryRequest.fromJson(categoryRequest);