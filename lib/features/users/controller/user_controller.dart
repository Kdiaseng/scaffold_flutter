import 'package:get/get.dart';
import 'package:scaffold_flutter/data/mapper/user_response_mapper.dart';
import 'package:scaffold_flutter/data/models/response/exception_response.dart';
import 'package:scaffold_flutter/utils/api_response.dart';
import 'package:scaffold_flutter/data/repository/user_repository_interface.dart';
import 'package:scaffold_flutter/features/users/view/user_details_view.dart';

class UserController extends GetxController {
  UserController(this.userRepository);

  final IUserRepository userRepository;

  final _listModeView = true.obs;

  bool get lisModeView => _listModeView.value;

  final _usersResponse = ApiResponse.start().obs;

  ApiResponse get usersResponse => _usersResponse.value;

  final _userDetails = ApiResponse.start().obs;

  ApiResponse get userDetails => _userDetails.value;

  changeModeView(bool isListMode) {
    _listModeView.value = isListMode;
  }

  getParams() => Get.arguments;

  goToUserDetails(int userId) =>
      Get.toNamed(UserDetailsView.route, arguments: userId);

  fetchUsers() async {
    _usersResponse(ApiResponse.loading());
    try {
      final response = await userRepository.getAllUsers(2);
      _usersResponse(
          ApiResponse.success(response.userResponse.asCategoryModelList()));
    } on ExceptionResponse catch (e) {
      _usersResponse(ApiResponse.error(e.statusCode, e.message));
      Get.snackbar("${e.statusCode}", e.message);
    }
  }

  getUserById(int userId) async {
    _userDetails(ApiResponse.loading());
    try {
      final response = await userRepository.getUserById(userId);
      _userDetails(ApiResponse.success(response.asUserDetailsModel()));
    } on ExceptionResponse catch (e) {
      _userDetails(ApiResponse.error(e.statusCode, e.message));
    }
  }
}
