import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static final LocalStorageService _localStorageService =
      LocalStorageService._internal();

  LocalStorageService._internal() {
    _loadSharedPreferences();
  }

  SharedPreferences? _sharedPreferences;

  factory LocalStorageService() {
    return _localStorageService;
  }

  Future<void> _loadSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> _checkIfSharedPreferencesHasBeenLoadedFirst() async {
    if (_sharedPreferences == null) {
      await _loadSharedPreferences();
    }
  }

  Future<void> saveDoubleData(String key, double value) async {
    await _checkIfSharedPreferencesHasBeenLoadedFirst();
    await _sharedPreferences?.setDouble(key, value);
  }

  Future<double> getDoubleData(String key) async {
    await _checkIfSharedPreferencesHasBeenLoadedFirst();

    return _sharedPreferences?.getDouble(key) ?? 0;
  }

  Future<void> saveStringListData(String key, List<String> values) async {
    await _checkIfSharedPreferencesHasBeenLoadedFirst();

    await _sharedPreferences?.setStringList(key, values);
  }

  Future<List<String>> getStringListData(String key) async {
    await _checkIfSharedPreferencesHasBeenLoadedFirst();

    return _sharedPreferences?.getStringList(key) ?? const [];
  }

  Future<List<String>> getAllKeys() async {
    await _checkIfSharedPreferencesHasBeenLoadedFirst();

    return _sharedPreferences?.getKeys().toList() ?? const [];
  }

  Future<void> removeItem(String id) async {
    await _checkIfSharedPreferencesHasBeenLoadedFirst();

    await _sharedPreferences?.remove(id);
  }
}
