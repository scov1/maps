import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._(this._prefs);

  late final SharedPreferences _prefs;

  static Future<LocalStorage> get instance async {
    final prefs = await SharedPreferences.getInstance();
    return LocalStorage._(prefs);
  }

  Future<bool> delete(String key) {
    return _prefs.remove(key);
  }

  Object? read(String key) {
    return _prefs.get(key);
  }
}
