import 'package:planner_app/models/category/category_response.dart';

abstract class CategoryService{
  Future<CategoryResponse>getAllCategories();
}