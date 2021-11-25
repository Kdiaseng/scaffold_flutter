import 'package:dio/dio.dart';
import 'package:scaffold_flutter/data/response/exception_response.dart';
import 'package:scaffold_flutter/data/response/user_paged_response.dart';
import '../user_repository_interface.dart';

class UserRepository extends IUserRepository {
  @override
  Future<UserPagedResponse> getAllUsers(int page) async {
    Dio clientDio = Dio();
    try {
      var response = await clientDio.get('https://reqres.in/api/users?$page');
      return UserPagedResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw ExceptionResponse(
          statusCode: e.response?.statusCode ?? 0, message: e.message);
    }
  }

  @override
  Future<UserWithSupport> getUserById(int userId) async {
    try {
      Dio clientDio = Dio();
      var response = await clientDio.get('https://reqres.in/api/users/$userId');
      return UserWithSupport.fromJson(response.data);
    } on DioError catch (e) {
      throw ExceptionResponse(
          statusCode: e.response?.statusCode ?? 0, message: e.message);
    }
  }
}
