import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileNameDev => '.env.dev';

  static String get fileNameProd => '.env.prod';

  static String get fileNameTest => '.env.test';

  static String get env => _get('ENV');
  static String get baseUrl => _get('API_URL');

  static String _get(String name) => dotenv.env[name] ?? "";
}
