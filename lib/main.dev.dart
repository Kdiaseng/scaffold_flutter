import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scaffold_flutter/utils/environment.dart';

import 'app/app_nick_name.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileNameDev);
  runApp(const AppNickName());
}
