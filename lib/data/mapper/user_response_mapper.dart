import 'package:scaffold_flutter/data/models/response/user_paged_response.dart';
import 'package:scaffold_flutter/features/users/model/user_details_model.dart';
import 'package:scaffold_flutter/features/users/model/user_model.dart';

extension UserResponseMapper on UserResponse {
  UserModel asUserModel() =>
      UserModel(name: firstName, email: email, imageUrl: avatar, userId: id);
}

extension UserResponseListMapper on List<UserResponse> {
  List<UserModel> asCategoryModelList() =>
      map((response) => response.asUserModel()).toList();
}

extension UserWithSupportMapper on UserWithSupport {
  UserDetailsModel asUserDetailsModel() => UserDetailsModel(
      name: data.firstName,
      email: data.email,
      imageUrl: data.avatar,
      description: support.text);
}
