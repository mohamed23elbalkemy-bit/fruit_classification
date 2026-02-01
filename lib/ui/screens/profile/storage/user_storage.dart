import '../model/user_model.dart';

class UserStorage {
  static UserModel currentUser = UserModel(
    name: "Mohamed Nasr",
    email: "mohamed23elbalkemy@gmail.com",
    imagePath: "assets/images/profile_image.jpg",
  );
  static void update(UserModel user) {
    currentUser = user;
  }
}
