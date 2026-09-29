import 'package:aistack/models/ai_tool.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploredRepository {
  static Future<void> explored(AiTool tool) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('explored_tool_ids') ?? [];
    if (!list.contains(tool.id)) {
      if (list.length < 100) {
        list.add(tool.id);
        await prefs.setStringList('explored_tool_ids', list);
      }
    }
  }

  static Future<int> getExplored() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('explored_tool_ids') ?? [];
    return list.length;
  }
}
