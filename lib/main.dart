import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scaffold_flutter/utils/environment.dart';

import 'app/app_nick_name.dart';

/*Em produção deve remover o uso do dotenv e enviar as variaveis na construção*/

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileNameProd);
  runApp(const AppNickName());
}
