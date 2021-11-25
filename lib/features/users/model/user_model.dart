class UserModel {
  final int userId;
  final String name;
  final String email;
  final String imageUrl;

  UserModel(
      {required this.name,
      required this.email,
      required this.imageUrl,
      required this.userId});
}
