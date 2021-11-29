import 'package:scaffold_flutter/data/models/response/user_paged_response.dart';

abstract class IUserRepository {
  Future<UserPagedResponse> getAllUsers(int page);

  Future<UserWithSupport> getUserById(int userId);
}
