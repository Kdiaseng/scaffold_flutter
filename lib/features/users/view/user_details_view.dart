import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaffold_flutter/utils/api_response.dart';
import 'package:scaffold_flutter/features/users/controller/user_controller.dart';
import 'package:scaffold_flutter/features/users/model/user_details_model.dart';
import 'package:scaffold_flutter/features/users/view/components/show_message_error_component.dart';

class UserDetailsView extends StatelessWidget {


  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    userController.getUserById(userController.getParams());
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final response = userController.userDetails;
          if (response is Success) {
            UserDetailsModel user = response.data;
            return Text('profile_name'.trParams({'name': user.name}));
          }
          return Container();
        }),
        centerTitle: true,
      ),
      body: Obx(() {
        final response = userController.userDetails;
        if (response is Success) {
          UserDetailsModel user = response.data;
          return buildContentDetails(userController, user, textTheme);
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

  Column buildContentDetails(UserController userController,
      UserDetailsModel user, TextTheme textTheme) {
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "description".tr,
            style: textTheme.headline6?.copyWith(color: Colors.deepPurple),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              user.description,
              style: textTheme.caption
                  ?.copyWith(fontSize: 24, fontWeight: FontWeight.normal),
            ),
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
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 8),
          Text("loading_data".tr)
        ],
      ),
    );
  }
}
