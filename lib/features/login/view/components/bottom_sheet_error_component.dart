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
    return Container(
      child: Column(
        children: [
          Expanded(child: Lottie.asset(PathAssets.errorLottie)),
          const SizedBox(height: 8),
          const Text("Desculpe"),
          const SizedBox(height: 8),
          Text(message),
          TextButton(onPressed: Get.back, child: const Text("Ok"))
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
