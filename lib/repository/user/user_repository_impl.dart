import 'package:dartz/dartz.dart';
import 'package:planner_app/models/user/user_request.dart';
import 'package:planner_app/models/user/user_response.dart';
import 'package:planner_app/repository/user/user_repository.dart';
import 'package:planner_app/services/user/user_service.dart';
import 'package:planner_app/utils/api_interceptor.dart';
import 'package:planner_app/utils/api_request_failure.dart';

class UserRepositoryImpl extends UserRepository{
  final UserService _service;

  UserRepositoryImpl(this._service): super();

  @override
  Future<Either<ApiRequestFailure, UserResponse>> loginUser(UserRequest request)async{
   return apiInterceptor(() => _service.login(request));
  }
}