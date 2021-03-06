import 'package:scaffold_flutter/data/models/response/exception_response.dart';
import 'package:scaffold_flutter/data/models/response/user_paged_response.dart';
import 'package:scaffold_flutter/data/provider/http_client_interface.dart';
import 'package:scaffold_flutter/utils/environment.dart';
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
      var response = await restClient.get('${Environment.baseUrl}/users',
          queries: {'page': page.toString()});
      return UserPagedResponse.fromJson(response);
    } on ExceptionResponse catch (e) {
      throw ExceptionResponse(statusCode: e.statusCode, message: e.message);
    }
  }

  @override
  Future<UserWithSupport> getUserById(int userId) async {
    try {
      var response =
          await restClient.get('${Environment.baseUrl}/users/$userId');
      return UserWithSupport.fromJson(response);
    } on ExceptionResponse catch (e) {
      throw ExceptionResponse(statusCode: e.statusCode, message: e.message);
    }
  }
}
