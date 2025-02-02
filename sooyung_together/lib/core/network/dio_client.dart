import 'package:dio/dio.dart';

import '../constants/api_endpoints.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio()
      ..options.baseUrl = ApiEndpoints.medicalInstitutions
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 10)
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) {
            // 공통 에러 처리
            return handler.next(error);
          },
        ),
      );
  }
}
