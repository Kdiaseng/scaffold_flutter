abstract class IRestClient {
  Future<Map<String, dynamic>> get(String url,{ Map<String, dynamic>? queries});
}
