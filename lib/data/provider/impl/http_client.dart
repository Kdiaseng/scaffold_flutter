import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:scaffold_flutter/data/models/response/exception_response.dart';
import 'package:scaffold_flutter/data/provider/http_client_interface.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IRestClient {
  @override
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? queries}) async {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: queries);

    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 3),
          onTimeout: () => throw TimeoutException('The connection has timed'));
      final dataJson = jsonDecode(response.body);
      log('REQUEST HTTP');
      return dataJson;
    } on TimeoutException catch (e) {
      throw ExceptionResponse(statusCode: 0, message: e.message ?? "Timeout");
    } on SocketException catch (e) {
      throw ExceptionResponse(statusCode: 0, message: e.message);
    }
  }

  @override
  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    var uri = Uri.parse(url);
    final response = await http.post(uri, body: data);
    return jsonDecode(response.body);
  }
}
