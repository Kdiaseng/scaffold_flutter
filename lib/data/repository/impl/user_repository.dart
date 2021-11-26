import 'package:dio/dio.dart';
import 'package:scaffold_flutter/data/provider/http_client_interface.dart';
import 'package:scaffold_flutter/data/response/exception_response.dart';
import 'package:scaffold_flutter/data/response/user_paged_response.dart';
import 'package:scaffold_flutter/utils/constants.dart';
import '../user_repository_interface.dart';

class UserRepository implements IUserRepository {
  UserRepository(this.restClient);

  final IRestClient restClient;

  @override
  Future<UserPagedResponse> getAllUsers(int page) async {
    try {
                      /*Test timeout*/
      // var response = await restClient
      //     .get('$baseUrl/users', queries: {'delay': 8.toString()});
      var response = await restClient
          .get('$baseUrl/users', queries: {'page': page.toString()});
      return UserPagedResponse.fromJson(response);
    } on DioError catch (e) {
      throw ExceptionResponse(
          statusCode: e.response?.statusCode ?? 0, message: e.message);
    }
  }

  @override
  Future<UserWithSupport> getUserById(int userId) async {
    try {
      var response = await restClient.get('$baseUrl/users/$userId');
      return UserWithSupport.fromJson(response);
    } on DioError catch (e) {
      throw ExceptionResponse(
          statusCode: e.response?.statusCode ?? 0, message: e.message);
    }
  }
}
