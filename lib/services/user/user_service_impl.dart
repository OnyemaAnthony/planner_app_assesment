import 'package:planner_app/models/user/user_request.dart';
import 'package:planner_app/models/user/user_response.dart';
import 'package:planner_app/services/user/user_service.dart';
import 'package:planner_app/utils/base_api.dart';

class UserServiceImpl extends BaseApi implements UserService{

  UserServiceImpl(): super();

  @override
  Future<UserResponse> login(UserRequest request) async{
    final response = await post('accounts:signInWithPassword',body: request.toJson());
    return UserResponse.fromJson(response);
  }
}