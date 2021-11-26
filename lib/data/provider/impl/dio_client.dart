import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:scaffold_flutter/data/models/response/exception_response.dart';
import 'package:scaffold_flutter/data/provider/http_client_interface.dart';

class DioClient implements IRestClient {
  final options = BaseOptions(connectTimeout: 5000, receiveTimeout: 3000);
  late Dio dio;

  DioClient.withAuthentication() {
    const token = "ZFDDXXGCHGCHGXC";

    dio = Dio(options);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Barier $token';

          return handler.next(options);
        },
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  DioClient() {
    dio = Dio(options);
  }

  @override
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? queries}) async {
    try {
      final response = await dio.get(url, queryParameters: queries);
      log('REQUEST DIO');
      return response.data;
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          throw ExceptionResponse(statusCode: 408, message: e.message);
        case DioErrorType.receiveTimeout:
          ExceptionResponse(statusCode: 408, message: e.message);
          break;
        case DioErrorType.sendTimeout:
          ExceptionResponse(statusCode: 408, message: e.message);
          break;
        case DioErrorType.response:
          ExceptionResponse(
              statusCode: e.response?.statusCode ?? 500, message: e.message);
          break;
        default:
          throw ExceptionResponse(
              statusCode: 500, message: 'Não foi possivel realizar requisição');
      }
      throw ExceptionResponse(
          statusCode: 500, message: 'Não foi possivel realizar requisição');
    }
  }

  @override
  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    final response = await dio.post(url, data: data);
    return response.data;
  }
}
