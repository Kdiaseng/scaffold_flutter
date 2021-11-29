import 'package:get/get.dart';

class NickNameTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'pt_BR': {
          'title': 'Alô Mundo!',
          'email': 'E-mail',
          'password': 'Senha',
          'enter': 'Entrar',
          'description': 'Descrição',
          'loading_data': 'Carregando dados...',
          'sorry': 'Desculpe!',
          'welcome': 'Bem Vindo!',
          'profile_name': 'Perfil de @name'
        },
        'en_US': {
          'title': 'Hello Wold',
          'email': 'E-mail',
          'password': 'Password',
          'enter': 'Enter',
          'description': 'Description',
          'loading_data': 'Loading data...',
          'sorry': 'Sorry!',
          'welcome': 'Welcome',
          'profile_name': 'Profile of @name'
        },
      };
}
