class ResponseCustom {
  ResponseCustom._();

  factory ResponseCustom.success(dynamic data) => Success(data: data);

  factory ResponseCustom.loading() => Loading();

  factory ResponseCustom.start() => Start();

  factory ResponseCustom.error(int code, String message) =>
      Error(statusCode: code, message: message);
}

class Success extends ResponseCustom {
  Success({required this.data}) : super._();

  final dynamic data;

}

class Start extends ResponseCustom {
  Start() : super._();
}

class Loading extends ResponseCustom {
  Loading() : super._();
}

class Error extends ResponseCustom {
  final int statusCode;
  final String message;

  Error({required this.statusCode, required this.message}) : super._();
}
