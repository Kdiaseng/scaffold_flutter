import 'package:get/get.dart';

import 'keys_translate.dart';

class NickNameTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'pt_BR': {
          KeysTranslate.email: 'E-mail',
          KeysTranslate.password: 'Senha',
          KeysTranslate.enter: 'Entrar',
          KeysTranslate.description: 'Descrição',
          KeysTranslate.loadingData: 'Carregando dados...',
          KeysTranslate.sorry: 'Desculpe!',
          KeysTranslate.welcome: 'Bem Vindo! @env',
          KeysTranslate.profileName: 'Perfil de @name'
        },
        'en_US': {
          KeysTranslate.email: 'E-mail',
          KeysTranslate.password: 'Password',
          KeysTranslate.enter: 'Enter',
          KeysTranslate.description: 'Description',
          KeysTranslate.loadingData: 'Loading data...',
          KeysTranslate.sorry: 'Sorry!',
          KeysTranslate.welcome: 'Welcome',
          KeysTranslate.profileName: 'Profile of @name'
        },
      };
}
