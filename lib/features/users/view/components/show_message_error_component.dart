import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scaffold_flutter/utils/path_assets.dart';

class ShowMessageErrorComponent extends StatelessWidget {
  const ShowMessageErrorComponent({
    Key? key,
    required this.onClick,
    required this.message,
  }) : super(key: key);

  final VoidCallback onClick;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          PathAssets.error,
          height: 500,
        ),
        Text(message),
        TextButton(onPressed: onClick, child: const Text("Tentar novamente"))
      ],
    );
  }
}
