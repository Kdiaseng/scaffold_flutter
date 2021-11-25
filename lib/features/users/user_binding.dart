import 'package:get/get.dart';
import 'package:scaffold_flutter/data/repository/impl/user_mock_reposotory.dart';
import 'package:scaffold_flutter/data/repository/impl/user_repository.dart';
import 'package:scaffold_flutter/features/users/controller/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(UserMockRepository()));
    // Get.lazyPut<UserController>(() => UserController(UserMockRepository()));
  }
}
