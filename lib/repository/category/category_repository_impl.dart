import 'package:dartz/dartz.dart';
import 'package:planner_app/models/category/category_response.dart';
import 'package:planner_app/repository/category/category_repository.dart';
import 'package:planner_app/services/category/category_service.dart';
import 'package:planner_app/utils/api_interceptor.dart';
import 'package:planner_app/utils/api_request_failure.dart';

class CategoryRepositoryImpl extends CategoryRepository{
  final CategoryService _categoryService;

  CategoryRepositoryImpl(this._categoryService);
  @override
  Future<Either<ApiRequestFailure, CategoryResponse>> getAllCategory() {
  return  apiInterceptor(() => _categoryService.getAllCategories());
  }

}