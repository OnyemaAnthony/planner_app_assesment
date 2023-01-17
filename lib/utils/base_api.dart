import 'package:dio/dio.dart';
import 'package:planner_app/di/injection.dart';
import 'package:planner_app/services/cache/cache.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

class BaseApi {

  String api_key = 'AIzaSyAFZ2uyHiPuQQi_4wf8cUQpdMEMqGapq_Q';
  late final Dio dio;

  BaseApi() {
    var options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      queryParameters: {'key': api_key},
    );

    dio = Dio(options);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      queryParameters: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      showProcessingTime: true,
      showCUrl: true,
      // canShowLog: kDebugMode,
    ));
  }

  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> headers = const {}}) async {
    dio.options.headers["Authorization"] = "Bearer ${await getToken()}";
    final response = await dio.get(path, queryParameters: query);

    return process(response);
  }

  Future<Map<String, dynamic>> post(String path,
      {Map<String, dynamic> body = const {},
      Map<String, dynamic> query = const {},
      Map<String, dynamic> headers = const {}}) async {
    dio.options.headers["Authorization"] = "Bearer ${await getToken()}";
    final response = await dio.post(path, data: body, queryParameters: query);
    return process(response);
  }

  Future<Map<String, dynamic>> patch(String path,
      {Map<String, dynamic> body = const {},
      Map<String, dynamic> query = const {},
      Map<String, dynamic> headers = const {}}) async {
    dio.options.headers["Authorization"] = "Bearer ${await getToken()}";
    final response = await dio.patch(path, data: body, queryParameters: query);

    return process(response);
  }

  Future<Map<String, dynamic>> put(String path,
      {Map<String, dynamic> body = const {},
      Map<String, dynamic> query = const {},
      Map<String, dynamic> headers = const {}}) async {
    dio.options.headers["Authorization"] = "Bearer ${await getToken()}";
    final response = await dio.put(path, data: body, queryParameters: query);
    return process(response);
  }

  Future<Map<String, dynamic>> delete(String path,
      {Map<String, dynamic> query = const {},
      Map<String, dynamic> headers = const {}}) async {
    dio.options.headers["Authorization"] = "Bearer ${await getToken()}";
    final response = await dio.delete(path, queryParameters: query);
    return process(response);
  }

  Map<String, dynamic> process(Response<dynamic> response) {
    return Map<String, dynamic>.from(response.data);
  }

  Future<String> getToken() async {
    String hardToken ='eyJhbGciOiJSUzI1NiIsImtpZCI6ImQwNTU5YzU5MDgzZDc3YWI2NDUxOThiNTIxZmM4ZmVmZmVlZmJkNjIiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYXBwbGF1ZG8tdG9kby1hcHAiLCJhdWQiOiJhcHBsYXVkby10b2RvLWFwcCIsImF1dGhfdGltZSI6MTY3Mzk2MTUxNCwidXNlcl9pZCI6IllWM1BkRTRlenZkcUl3dlU5RGVFdFhXZDN4QzMiLCJzdWIiOiJZVjNQZEU0ZXp2ZHFJd3ZVOURlRXRYV2QzeEMzIiwiaWF0IjoxNjczOTYxNTE0LCJleHAiOjE2NzM5NjUxMTQsImVtYWlsIjoidGVzdEB0ZXN0LmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ0ZXN0QHRlc3QuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.E4Ko83FbK0qEutYIiyX9nkuLlUgSttZgzrxrW6WIRBxNBh6TkXchwLb7CfBTyNHu6XrKFJsjv79W1MfxAaw6_b19seCSJa745p-2z_iQGELGKD2fy5nQO8zAR7HLLRtzeef1sbapS7-FZ2cCzUjP4lF3fQhadT3_zNjYYX0di8W26Fzq_tDKpVeeXvhTPoWNWmVT9_2RPdFZRuLglo7RT-kI_RIihKs8lFum0N3nyhrB7WT9TpUGEC-mqXksGuunS0IO_1TDONS1CY1upyZEtVtjbsvaLDfFcUQX1nEjTj4YJQdxfrxRllahgeU5n7tc0o5EiOGu9it5eKxwxjJeog';
    final token = getIt<Cache>();
    return hardToken;
  }
}