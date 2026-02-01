class UserModel {
  final String name;
  final String email;
  final String imagePath;

  UserModel({
    required this.name,
    required this.email,
    required this.imagePath,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? imagePath,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
