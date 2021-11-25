import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_flutter/features/users/model/user_model.dart';

class ListUserComponent extends StatelessWidget {
  const ListUserComponent({
    Key? key,
    required this.users,
    required this.onClick,
  }) : super(key: key);

  final List<UserModel> users;
  final Function(int userId) onClick;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final UserModel user = users[index];
        return ListTile(
          onTap: () {
            onClick(user.userId);
          },
          title: Text(user.name),
          leading: Hero(
            tag: 'hero-${user.userId}',
            child: CircleAvatar(
              radius: 24,
              backgroundImage: CachedNetworkImageProvider(user.imageUrl),
            ),
          ),
          subtitle: Text(user.email),
        );
      },
    );
  }
}
