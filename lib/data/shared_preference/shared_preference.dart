import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  /// Stores the JWT token in Shared Preferences
  Future<void> saveToken({required String accessToken}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', accessToken);
    log('Token stored successfully');
  }

  /// Checks if the user is registered by verifying if the JWT token is stored
  Future<bool> checkRegistrationStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('jwt_token');
    return token != null;
  }

  /// Deletes the stored JWT token (useful for logout)
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
    log('Token cleared successfully');
  }
}
