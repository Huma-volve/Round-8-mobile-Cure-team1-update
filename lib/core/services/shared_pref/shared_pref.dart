import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  factory SharedPref() {
    return preferences;
  }

  SharedPref._internal();
  static final SharedPref preferences = SharedPref._internal();

  static late SharedPreferences sharedPreferences;

  ///Below method is to initialize the SharedPreference instance.
  Future<dynamic> instantiatePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ///Below method is to return the SharedPreference instance.
  SharedPreferences getPreferenceInstance() {
    return sharedPreferences;
  }

  ///Below method is to set the string value in the SharedPreferences.
  Future<dynamic> setString(String key, String stringValue) async {
    await sharedPreferences.setString(key, stringValue);
  }

  ///Below method is to get the string value from the SharedPreferences.
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  ///Below method is to set the boolean value in the SharedPreferences.
  Future<dynamic> setBoolean(String key, bool booleanValue) async {
    await sharedPreferences.setBool(key, booleanValue);
  }

  ///Below method is to get the boolean value from the SharedPreferences.
  bool? getBoolean(String key) {
    return sharedPreferences.getBool(key);
  }

  ///Below method is to set the double value in the SharedPreferences.
  Future<dynamic> setDouble(String key, double doubleValue) async {
    await sharedPreferences.setDouble(key, doubleValue);
  }

  ///Below method is to set the double value from the SharedPreferences.
  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  ///Below method is to set the int value in the SharedPreferences.
  Future<dynamic> setInt(String key, int intValue) async {
    await sharedPreferences.setInt(key, intValue);
  }

  ///Below method is to get the int value from the SharedPreferences.
  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  ///Below method is to remove the received preference.
  Future<dynamic> removePreference(String key) async {
    await sharedPreferences.remove(key);
  }

  ///Below method is to check the availability of the received preference .
  bool containPreference(String key) {
    if (sharedPreferences.get(key) == null) {
      return false;
    } else {
      return true;
    }
  }

  ///Below method is to clear the SharedPreference.
  Future<dynamic> clearPreferences() async {
    await sharedPreferences.clear();
  }
  //
  static Future<bool> setStringList(String key, List<String> value) async {
    return await sharedPreferences.setStringList(key, value);
  }

  static List<String>? getStringList(String key) {
    return sharedPreferences.getStringList(key);
  }

  static bool containsKey(String key) {
    return sharedPreferences.containsKey(key);
  }
}

//نصيحه
//يبنى ما كل دا فوق  اتعود تتأقلم على كود الناس متثبتش  دماغك عشان تتاقلم
class Cachehelper {
  static late SharedPreferences _shared;
  static const String _onboardingSeenKey = 'onboarding_seen';
  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';
  static const String _userPhoneKey = 'user_phone';
  static const String _userBirthdateKey = 'user_birthdate';
  static const String _favoriteIdsKey = 'favorite_doctor_ids';
  static Future<void> init() async {
    _shared = await SharedPreferences.getInstance();
  }

  static Future<void> cacheToken(token) async {
    await _shared.setString("token", token);
  }
  static Future<void> cacheUserName(String name) async {
    await _shared.setString(_userNameKey, name);
  }

  static String? getUserName() {
    return _shared.getString(_userNameKey);
  }


  static String? getToken() {
    return _shared.getString("token");
  }

  static Future<void> clearToken() async {
    await _shared.remove("token");
  }

  static Future<void> clearUserProfile() async {
    await _shared.remove(_userNameKey);
    await _shared.remove(_userEmailKey);
    await _shared.remove(_userPhoneKey);
    await _shared.remove(_userBirthdateKey);
    await _shared.remove(_favoriteIdsKey);
  }

  static Future<void> cacheOnboardingSeen(bool seen) async {
    await _shared.setBool(_onboardingSeenKey, seen);
  }

  static bool getOnboardingSeen() {
    return _shared.getBool(_onboardingSeenKey) ?? false;
  }
  static Future<void> cacheUserEmail(String email) async {
    await _shared.setString(_userEmailKey, email);
  }

  static String? getUserEmail() {
    return _shared.getString(_userEmailKey);
  }

  static Future<void> cacheUserPhone(String phone) async {
    await _shared.setString(_userPhoneKey, phone);
  }

  static String? getUserPhone() {
    return _shared.getString(_userPhoneKey);
  }

  static Future<void> cacheUserBirthdate(String birthdate) async {
    await _shared.setString(_userBirthdateKey, birthdate);
  }

  static String? getUserBirthdate() {
    return _shared.getString(_userBirthdateKey);
  }

  static bool hasFavoriteIds() {
    return _shared.getStringList(_favoriteIdsKey) != null;
  }

  static Future<void> cacheFavoriteIds(Iterable<int> ids) async {
    final values = ids.map((id) => id.toString()).toList();
    await _shared.setStringList(_favoriteIdsKey, values);
  }

  static Set<int> getFavoriteIds() {
    final values = _shared.getStringList(_favoriteIdsKey);
    if (values == null) {
      return <int>{};
    }
    return values.map(int.parse).toSet();
  }
  }


