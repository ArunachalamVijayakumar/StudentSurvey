import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _keyEmail = "email";
  static const String _keyPassword = "password";
  static const String _keyIsLoggedIn = "isLoggedIn";

  // Save user credentials (Sign-up)
  static Future<void> saveUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPassword, password);
  }

  // Attempt login
  static Future<bool> loginUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString(_keyEmail);
    String? storedPassword = prefs.getString(_keyPassword);

    if (storedEmail == email && storedPassword == password) {
      await prefs.setBool(_keyIsLoggedIn, true); // Mark as logged in
      return true; // Login successful
    }
    return false; // Login failed
  }

  // Check if a user is already logged in
  static Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  // Logout (Clears login status but keeps user data)
  static Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, false); // Just update login status
  }
}
