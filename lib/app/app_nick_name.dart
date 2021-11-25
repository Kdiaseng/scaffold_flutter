import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaffold_flutter/features/users/view/user_details_view.dart';
import 'package:scaffold_flutter/features/users/view/users_view.dart';

class AppNickName extends StatelessWidget {
  const AppNickName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: UserView.route,
      getPages: [
        GetPage(name: UserView.route, page: () => const UserView()),
        GetPage(
          name: UserDetailsView.route,
          page: () => const UserDetailsView(),
        ),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserView(),
    );
  }
}
