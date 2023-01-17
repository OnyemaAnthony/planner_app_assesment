import 'package:planner_app/di/injection.dart';
import 'package:planner_app/models/user/user_request.dart';
import 'package:planner_app/models/user/user_response.dart';
import 'package:dartz/dartz.dart';
import 'package:planner_app/repository/user/user_repository.dart';
import '../../utils/api_request_failure.dart';
import '../use_case.dart';

class LoginUserCase with UseCases<Either<ApiRequestFailure, UserResponse>, UserRequest>{
  final UserRepository userRepository;

  LoginUserCase(this.userRepository);
  @override
  Future<Either<ApiRequestFailure, UserResponse>> call(UserRequest params) {
    return userRepository.loginUser(params);
  }
  static LoginUserCase get it => getIt<LoginUserCase>();
}