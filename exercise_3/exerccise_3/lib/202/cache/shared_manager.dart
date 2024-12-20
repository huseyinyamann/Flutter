import 'package:exerccise_3/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager() {
  }

  void checkPreferences() {
    if (preferences == null) throw SharedNotInitializeException();

    //if (preferences == null) init();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    checkPreferences();
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    checkPreferences();
    await preferences?.setStringList(key.name, value);
  }

  List<String>? GetStrings(SharedKeys key) {
    checkPreferences();
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    checkPreferences();
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    checkPreferences();
    return await preferences?.remove(key.name) ?? false;
  }
}
