import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static late final SharedPreferences _instance;

  static Future<void> init() async =>
      _instance = await SharedPreferences.getInstance();

  static Future clear() async => await _instance.clear();
  static Future removeData({required String key}) async =>
      await _instance.remove(key);
}
