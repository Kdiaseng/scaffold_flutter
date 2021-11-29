import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileNameDev => '.env.dev';

  static String get fileNameProd => '.env.prod';

  static String get fileNameTest => '.env.test';

  static String get env => _get('ENV');
  static String get baseUrl => _get('API_URL');

  /*Meio pra mandar variaveisl em tempo de execução
  flutter run --release --dart-define url_base='http://api_url'*/
  // static String get urlBase => const String.fromEnvironment("url_base");

  static String _get(String name) => dotenv.env[name] ?? "";
}
