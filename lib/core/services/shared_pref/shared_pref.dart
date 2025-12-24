import 'package:cure_team_1_update/core/services/shared_pref/pref_keys.dart';
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
  static const String _userNameKey = 'user_name';
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
   /////////

  static const _favoritesKey = PrefKeys.favoriteDoctorIds;


  static void cacheFavoriteIds(Set<int> ids) {
  final list = ids.toList();
  SharedPref.setStringList(
  _favoritesKey,
  list.map((e) => e.toString()).toList(),
  );
  }

  static Set<int> getFavoriteIds() {
  final list = SharedPref.getStringList(_favoritesKey);
  if (list == null) return {};
  return list.map(int.parse).toSet();
  }

  static bool hasFavoriteIds() {
  return SharedPref.containsKey(_favoritesKey);
  }
  }


