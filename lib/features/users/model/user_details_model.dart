class UserDetailsModel {
  final String name;
  final String imageUrl;
  final String email;
  final String description;

  UserDetailsModel(
      {required this.name,
      required this.email,
      required this.imageUrl,
      required this.description});
}
