class UserLoginProvider {
  String? email;
  String? password;

  UserLoginProvider({required String? email, required String? password});

  void setEmail(String? newEmail) {
    email = newEmail;
  }

  void setPassword(String? newPassword) {
    password = newPassword;
  }
}
