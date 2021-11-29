class ApiResponse {
  ApiResponse._();

  factory ApiResponse.success(dynamic data) => Success(data: data);

  factory ApiResponse.loading() => Loading();

  factory ApiResponse.start() => Start();

  factory ApiResponse.error(int code, String message) =>
      Error(statusCode: code, message: message);
}

class Success extends ApiResponse {
  Success({required this.data}) : super._();

  final dynamic data;

}

class Start extends ApiResponse {
  Start() : super._();
}

class Loading extends ApiResponse {
  Loading() : super._();
}

class Error extends ApiResponse {
  final int statusCode;
  final String message;

  Error({required this.statusCode, required this.message}) : super._();
}
