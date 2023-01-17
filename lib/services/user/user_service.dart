import 'package:planner_app/models/user/user_request.dart';
import 'package:planner_app/models/user/user_response.dart';

abstract class UserService{
  Future<UserResponse>login(UserRequest request);
}