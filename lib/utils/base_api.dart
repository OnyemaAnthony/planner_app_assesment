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
    String hardToken ='eyJhbGciOiJSUzI1NiIsImtpZCI6ImY1NWU0ZDkxOGE0ODY0YWQxMzUxMDViYmRjMDEwYWY5Njc5YzM0MTMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYXBwbGF1ZG8tdG9kby1hcHAiLCJhdWQiOiJhcHBsYXVkby10b2RvLWFwcCIsImF1dGhfdGltZSI6MTY3MzkxOTQ2NiwidXNlcl9pZCI6IllWM1BkRTRlenZkcUl3dlU5RGVFdFhXZDN4QzMiLCJzdWIiOiJZVjNQZEU0ZXp2ZHFJd3ZVOURlRXRYV2QzeEMzIiwiaWF0IjoxNjczOTE5NDY2LCJleHAiOjE2NzM5MjMwNjYsImVtYWlsIjoidGVzdEB0ZXN0LmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ0ZXN0QHRlc3QuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.CP2sydswJvzEjECE72t2VEuBkHZXAO1q1tA1XYJpmi6GR4biFMeea2D91aHH8JV2nVYNYHNCha2eeYLkJy_VgDO-OxsBb5rLO7On31BWIu6LqpOQfJESX4vqjAsexXQyHZGQc8Q2f2rA5tLwVza9BUMk_hQtpmNgY1C4z6t1zSWgrs78tugEXZ7ZQEemGkJ2zDZbKFBw07CLnMj9Cf0ZJuoGb9s9AiNho1IuWkc26VrjLwSgznV1oMU1ZSZlJl7PD27dsY6UyfqyribO6O-qRj_I21-cZzabWUT21JTO1Ur19U4aszt19dYQlaRorBmGt2cvSlZtEiLLM-WHCEA9CA';

    final token = getIt<Cache>();
    return hardToken;
  }
}
