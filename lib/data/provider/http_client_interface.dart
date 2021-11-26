abstract class IRestClient {
  Future<Map<String, dynamic>> get(String url, {Map<String, dynamic>? queries});

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> data);
}
