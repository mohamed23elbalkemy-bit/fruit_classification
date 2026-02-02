class AuthService {
  /// login (mock)
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    // MOCK LOGIN
    if (email == 'test@test.com' && password == '12345678') {
      return true;
    }
    return false;
  }

  /// register (mock)
  static Future<bool> register({
    required String username,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
