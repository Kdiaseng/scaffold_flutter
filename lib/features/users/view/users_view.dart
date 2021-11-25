import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaffold_flutter/data/response/response_custom.dart';
import 'package:scaffold_flutter/features/users/controller/user_controller.dart';
import 'components/grid_user_component.dart';
import 'components/list_user_component.dart';
import 'components/show_message_error_component.dart';

class UserView extends StatelessWidget {
  static const route = "/";

  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    userController.fetchUsers();

    final appBarSliver = SliverAppBar(
      floating: true,
      forceElevated: true,
      actions: [
        IconButton(
          onPressed: () => userController.changeModeView(true),
          icon: const Icon(Icons.view_list_rounded),
        ),
        IconButton(
          onPressed: () => userController.changeModeView(false),
          icon: const Icon(Icons.grid_view_rounded),
        )
      ],
    );

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [appBarSliver],
        body: Obx(() {
          final userResponse = userController.usersResponse;

          if (userResponse is Start) {
            return Container();
          }
          if (userResponse is Success) {
            return userController.lisModeView
                ? ListUserComponent(
                    users: userResponse.data,
                    onClick: userController.goToUserDetails,
                  )
                : GridUserComponent(
                    users: userResponse.data,
                    onClick: userController.goToUserDetails,
                  );
          }
          if (userResponse is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (userResponse is Error) {
            return ShowMessageErrorComponent(
                onClick: userController.fetchUsers);
          }
          return Container();
        }),
      ),
    );
  }
}
