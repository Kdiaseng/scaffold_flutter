import 'dart:convert';
import 'dart:developer';

import 'package:scaffold_flutter/data/provider/http_client_interface.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IRestClient {
  @override
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? queries}) async {
    var uri = Uri.parse(url);
    uri = uri.replace(queryParameters: queries);
    final response = await http.get(uri);
    final dataJson = jsonDecode(response.body);
    log('REQUEST HTTP');
    return dataJson;
  }
}
