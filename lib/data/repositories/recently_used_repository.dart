import 'package:shared_preferences/shared_preferences.dart';

class RecentlyUsedRepository {
  static const String _key = 'recentlyUsed';

  static Future<List<String>> getRecentlyUsedIds() async {
    final pref = await SharedPreferences.getInstance();
    final list = pref.getStringList(_key) ?? [];
    return list;
  }

  static Future<void> setRecentlyUsed(List<String> ids) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setStringList(_key, ids);
  }
}
