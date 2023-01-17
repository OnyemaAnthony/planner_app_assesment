import '../models/user/user_request.dart';
import '../usecase/user/login_user_case.dart';

import 'package:shared_preferences/shared_preferences.dart';
class Setup{
  static setUp()async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    final response = await LoginUserCase.it.call(UserRequest(email: 'test@test.com',password:'password',returnSecureToken: true ));
    response.fold((l) {
      print(l.error);
    }, (r) {
      pref.setString('token', r.idToken??'');
    });
  }
}