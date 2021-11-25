import 'package:flutter/material.dart';

class AppBarNickName extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Function onBack;

  const AppBarNickName({Key? key, required this.title, required this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: Text(title),
      leading: IconButton(
        onPressed: () {
          onBack();
        },
        icon: const Icon(Icons.arrow_back_outlined),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
