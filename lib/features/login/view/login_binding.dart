import 'package:get/get.dart';
import 'package:scaffold_flutter/data/provider/http_client_interface.dart';
import 'package:scaffold_flutter/data/provider/impl/dio_client.dart';
import 'package:scaffold_flutter/data/repository/impl/login_repository.dart';
import 'package:scaffold_flutter/data/repository/login_repository_interface.dart';
import 'package:scaffold_flutter/features/login/controller/login_controller.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IRestClient>(() => DioClient.withAuthentication());
    Get.lazyPut<ILoginRepository>(() => LoginRepository(Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));
  }
}
