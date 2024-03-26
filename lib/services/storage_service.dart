import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  void saveBool(String key,bool value) async {
     final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(key, value);
  }

   getBool(String key) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool(key)??false;
  }
}
