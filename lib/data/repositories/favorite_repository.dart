import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepository {
  static const String _key = 'favorite';

  static Future<Set<String>> getFavoriteIds() async {
    final pref = await SharedPreferences.getInstance();
    return (pref.getStringList(_key) ?? []).toSet();
  }

  static Future<void> setFavoriteIds(List<String> ids) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setStringList(_key, ids);
  }
}
