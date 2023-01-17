import 'package:planner_app/models/category/category_response.dart';
import 'package:planner_app/services/category/category_service.dart';
import 'package:planner_app/utils/base_api.dart';

class CategoryServiceImpl extends BaseApi implements CategoryService{
  @override
  Future<CategoryResponse> getAllCategories() async{
    String url='https://firestore.googleapis.com/v1/projects/applaudo-todo-app/databases/(default)/documents/categories?key=';
    final response = await get(url);
    return CategoryResponse.fromJson(response);
  }
  
}