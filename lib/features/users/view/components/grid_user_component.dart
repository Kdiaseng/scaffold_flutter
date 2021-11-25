import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_flutter/features/users/model/user_model.dart';

class GridUserComponent extends StatelessWidget {
  const GridUserComponent({
    Key? key,
    required this.users,
    required this.onClick,
  }) : super(key: key);

  final List<UserModel> users;
  final Function(int userId) onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            maxCrossAxisExtent: 300),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final UserModel user = users[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                onClick(user.userId);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'hero-${user.imageUrl}',
                      child: CachedNetworkImage(
                          fit: BoxFit.cover, imageUrl: user.imageUrl),
                    ),
                  ),
                  ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
