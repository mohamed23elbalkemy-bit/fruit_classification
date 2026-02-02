class AuthService {
  // ================= LOGIN =================
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));

    return true;
  }

  // ================= REGISTER =================
  static Future<bool> register({
    required String username,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));

    return true;
  }

  // ================= FORGOT PASSWORD =================
  static Future<bool> forgotPassword(String email) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return true;
  }
}
