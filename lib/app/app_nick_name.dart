import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaffold_flutter/features/login/view/login_binding.dart';
import 'package:scaffold_flutter/features/login/view/login_view.dart';
import 'package:scaffold_flutter/features/users/user_binding.dart';
import 'package:scaffold_flutter/features/users/view/user_details_view.dart';
import 'package:scaffold_flutter/features/users/view/users_view.dart';
import 'package:scaffold_flutter/themes/themes_nick_name.dart';
import 'package:scaffold_flutter/utils/nick_name_translations.dart';

class AppNickName extends StatelessWidget {
  const AppNickName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      title: 'Flutter Demo',
      initialRoute: LoginView.route,
      translations: NickNameTranslations(),
      locale: const Locale('pt', 'BR'),
      // initialBinding: UserBinding(),
      getPages: [
        GetPage(
            name: LoginView.route,
            page: () => const LoginView(),
            binding: LoginBiding()),
        GetPage(
            name: UserView.route,
            page: () => const UserView(),
            binding: UserBinding()),
        GetPage(
          name: UserDetailsView.route,
          page: () => const UserDetailsView(),
        ),
      ],
      theme: ThemeData(
        textTheme: ThemesNickName.textTheme,
        inputDecorationTheme: ThemesNickName.inputDecorationTheme,
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
