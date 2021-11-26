import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:scaffold_flutter/data/provider/http_client_interface.dart';

class DioClient implements IRestClient {
  final options = BaseOptions(connectTimeout: 5000, receiveTimeout: 3000);
  late Dio dio;

  DioClient() {
    dio = Dio(options);
  }

  @override
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? queries}) async {
    final response = await dio.get(url, queryParameters: queries);
    log('REQUEST DIO');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    final response = await dio.post(url, data: data);
    return response.data;
  }
}
