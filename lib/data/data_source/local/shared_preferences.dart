import 'package:event_hub/data/data_source/local/app_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements AppPreferences {
  final SharedPreferences prefs;
  SharedPreferencesStorage(this.prefs);

  @override
  Future<void> clear() async {
    await prefs.clear();
  }

  @override
  Future<bool?> getBool(String key) {
    return Future.value(prefs.getBool(key));
  }

  @override
  Future<int?> getInt(String key)  {
    return Future.value(prefs.getInt(key));
  }

  @override
  Future<String?> getString(String key) async {
    return Future.value(prefs.getString(key));
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  @override
  Future<void> saveInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  @override
  Future<void> saveString(String key, String value)async {
    await prefs.setString(key, value);
  }
}
