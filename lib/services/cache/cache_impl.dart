import 'package:planner_app/services/cache/cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheImpl extends Cache{
  @override
  Future<String> getToken()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print('token is ${sharedPreferences.getString('token')}');
    return sharedPreferences.getString('token')??'';
  }

}