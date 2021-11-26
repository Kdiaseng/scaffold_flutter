import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:scaffold_flutter/data/provider/http_client_interface.dart';

class DioClient implements IRestClient {
  final dio = Dio();

  @override
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? queries}) async {
    final response = await dio.get(url, queryParameters: queries);
    log('REQUEST DIO');
    return response.data;
  }
}
