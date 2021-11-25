import 'package:get/get.dart';
import 'package:scaffold_flutter/features/users/controller/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
