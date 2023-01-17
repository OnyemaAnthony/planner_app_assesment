import 'package:planner_app/models/category/category_response.dart';
import 'package:dartz/dartz.dart';
import '../../utils/api_request_failure.dart';

abstract class CategoryRepository{
  Future<Either<ApiRequestFailure, CategoryResponse>>getAllCategory();
}