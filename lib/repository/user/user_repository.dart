import 'package:planner_app/models/user/user_request.dart';
import 'package:dartz/dartz.dart';
import 'package:planner_app/models/user/user_response.dart';
import '../../utils/api_request_failure.dart';

abstract class UserRepository{
  Future<Either<ApiRequestFailure, UserResponse>>loginUser(UserRequest request);
}