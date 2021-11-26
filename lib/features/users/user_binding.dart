import 'package:get/get.dart';
import 'package:scaffold_flutter/data/provider/http_client_interface.dart';
import 'package:scaffold_flutter/data/provider/impl/dio_client.dart';
import 'package:scaffold_flutter/data/provider/impl/http_client.dart';
import 'package:scaffold_flutter/data/repository/impl/user_mock_repository.dart';
import 'package:scaffold_flutter/data/repository/impl/user_repository.dart';
import 'package:scaffold_flutter/data/repository/user_repository_interface.dart';
import 'package:scaffold_flutter/features/users/controller/user_controller.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
     // Get.lazyPut<UserController>(() => UserController(UserMockRepository()));

    // Get.lazyPut<IRestClient>(() => HttpClient());
    Get.lazyPut<IRestClient>(() => DioClient());
    Get.lazyPut<IUserRepository>(() => UserRepository(Get.find()));
    Get.lazyPut<UserController>(() => UserController(Get.find()));
  }
}
