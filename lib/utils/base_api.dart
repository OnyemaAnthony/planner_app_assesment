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
    String hardToken ='eyJhbGciOiJSUzI1NiIsImtpZCI6ImQwNWI0MDljNmYyMmM0MDNlMWY5MWY5ODY3YWM0OTJhOTA2MTk1NTgiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYXBwbGF1ZG8tdG9kby1hcHAiLCJhdWQiOiJhcHBsYXVkby10b2RvLWFwcCIsImF1dGhfdGltZSI6MTY3NDg0NzcxNSwidXNlcl9pZCI6IllWM1BkRTRlenZkcUl3dlU5RGVFdFhXZDN4QzMiLCJzdWIiOiJZVjNQZEU0ZXp2ZHFJd3ZVOURlRXRYV2QzeEMzIiwiaWF0IjoxNjc0ODQ3NzE1LCJleHAiOjE2NzQ4NTEzMTUsImVtYWlsIjoidGVzdEB0ZXN0LmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ0ZXN0QHRlc3QuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.nBffyPBRtFu19syWqQ-09wuV5iUQvWg1HNpby3h2TutdWzPYNmZoNZbqfeiwjlSg2gOEm6mENVnnrD-YPfUqj5Cm7PITv63Z4LZQipCzrG6Cyg32AGZc0sOQPj24xS2Tg8RftjHdyfHUSFm-t954c7tNjXdM3-qtRDYUGA3hxVOBrJc2UKFGTMZ-UzdUohiG9i1wrseR1c9b3aN1iVPABAe1Kyymc7Jlh7e21AYA9MJOSIZlLBcOuJjkvG_I8uxY06ryZnPLeRQxcabiv33rQUj23RRml9yymvqlGSIxej-l1GYrp62KcUrdEa1NVPegxn36Ayh14GprzYXgykR-jw';
    return hardToken;
  }
}
