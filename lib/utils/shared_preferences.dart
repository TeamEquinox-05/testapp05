import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String keyIsLoggedIn = 'isLoggedIn';
  static const String keyUserId = 'userId';
  static const String keyUserType = 'userType';
  static const String keyUsername = 'username';
  static const String keyEmail = 'email';

  // Singleton instance
  static final SharedPrefs _instance = SharedPrefs._();
  static SharedPreferences? _prefs;

  // Private constructor
  SharedPrefs._();

  static Future<SharedPrefs> getInstance() async {
    if (_prefs == null) {
      await _instance._init();
    }
    return _instance;
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Login related methods
  Future<bool> setLoggedIn(bool value) async {
    if (_prefs == null) await _init();
    return await _prefs!.setBool(keyIsLoggedIn, value);
  }

  bool isLoggedIn() {
    return _prefs?.getBool(keyIsLoggedIn) ?? false;
  }

  // User related methods
  Future<bool> setUserId(String userId) async {
    if (_prefs == null) await _init();
    return await _prefs!.setString(keyUserId, userId);
  }

  String? getUserId() {
    return _prefs?.getString(keyUserId);
  }

  Future<bool> setUserType(String type) async {
    if (_prefs == null) await _init();
    return await _prefs!.setString(keyUserType, type);
  }

  String getUserType() {
    return _prefs?.getString(keyUserType) ?? 'user';
  }

  Future<bool> setUsername(String username) async {
    if (_prefs == null) await _init();
    return await _prefs!.setString(keyUsername, username);
  }

  String? getUsername() {
    return _prefs?.getString(keyUsername);
  }

  Future<bool> setEmail(String email) async {
    if (_prefs == null) await _init();
    return await _prefs!.setString(keyEmail, email);
  }

  String? getEmail() {
    return _prefs?.getString(keyEmail);
  }

  // Clear all data
  Future<bool> clearAll() async {
    if (_prefs == null) await _init();
    return await _prefs!.clear();
  }

  // Clear specific user data but keep settings
  Future<void> clearUserData() async {
    if (_prefs == null) await _init();
    await _prefs!.remove(keyUserId);
    await _prefs!.remove(keyUserType);
    await _prefs!.remove(keyUsername);
    await _prefs!.remove(keyEmail);
    await _prefs!.remove(keyIsLoggedIn);
  }
}
