import 'package:news/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static late final SharedPreferences _instance;

  static Future<void> init() async =>
      _instance = await SharedPreferences.getInstance();

  static Future setBool({required bool value}) async =>
      await _instance.setBool(Constants.showOnboarding, value);

  static bool? getBool() => _instance.getBool(Constants.showOnboarding) ?? true;
}
