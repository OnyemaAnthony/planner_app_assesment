import 'package:planner_app/di/injection.dart';
import 'package:planner_app/models/category/category_response.dart';
import 'package:dartz/dartz.dart';
import 'package:planner_app/repository/category/category_repository.dart';
import '../../utils/api_request_failure.dart';
import '../use_case.dart';

class GetAllCategoryCase with NoParamUseCases<Either<ApiRequestFailure,CategoryResponse>>{
  final CategoryRepository _categoryRepository;

  GetAllCategoryCase(this._categoryRepository);
  @override
  Future<Either<ApiRequestFailure, CategoryResponse>> call() {
    return _categoryRepository.getAllCategory();
  }
  static GetAllCategoryCase get it =>getIt<GetAllCategoryCase>();
}