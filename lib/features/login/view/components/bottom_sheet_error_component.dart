import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:scaffold_flutter/utils/path_assets.dart';

class BottomSheetErrorComponent extends StatelessWidget {
  const BottomSheetErrorComponent({Key? key, required this.message})
      : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      child: Column(
        children: [
          Expanded(child: Lottie.asset(PathAssets.errorLottie)),
          Text("sorry".tr,
              style: textTheme.headline5?.copyWith(color: Colors.deepPurple)),
          const SizedBox(height: 16),
          Text(
            message,
            style: textTheme.subtitle2,
          ),
          TextButton(onPressed: Get.back, child: const Text("OK"))
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
    );
  }
}
