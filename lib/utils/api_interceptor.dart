import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'api_request_failure.dart';
Future<Either<ApiRequestFailure, R>> apiInterceptor<R>(Future<R> Function() func) async {
  try {
    final res = await func();
    return Right(res);
  }catch (e) {
    log("$e");
    return Left(ApiRequestFailure(e));
  }
}