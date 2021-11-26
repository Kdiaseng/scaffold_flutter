import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaffold_flutter/data/models/response/response_custom.dart';
import 'package:scaffold_flutter/features/users/controller/user_controller.dart';
import 'package:scaffold_flutter/features/users/model/user_details_model.dart';
import 'package:scaffold_flutter/features/users/view/components/show_message_error_component.dart';

class UserDetailsView extends StatelessWidget {
  static const route = "/details";

  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    userController.getUserById(userController.getParams());

    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        final response = userController.userDetails;
        if (response is Success) {
          UserDetailsModel user = response.data;
          return buildContentDetails(userController, user);
        }

        if (response is Loading) {
          return _buildLoading();
        }

        if (response is Error) {
          return ShowMessageErrorComponent(
              message: response.message,
              onClick: () {
                userController.getUserById(userController.getParams());
              });
        }
        return Container();
      }),
    );
  }

  Column buildContentDetails(
      UserController userController, UserDetailsModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Hero(
            tag: 'hero-${userController.getParams()}',
            child: CachedNetworkImage(
                fit: BoxFit.contain, imageUrl: user.imageUrl),
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Description"),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(user.description),
          ),
        )
      ],
    );
  }

  Center _buildLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            height: 8,
          ),
          Text("Carregando dados...")
        ],
      ),
    );
  }
}
