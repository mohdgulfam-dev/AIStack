import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aistack/data/repositories/recently_used_repository.dart';

class RecentlyUsedNotifier extends AsyncNotifier<List<AiTool>> {
  @override
  Future<List<AiTool>> build() async {
    final list = await RecentlyUsedRepository.getRecentlyUsedIds();

    final filteredList = aiToolsData
        .where((tool) => list.contains(tool.id))
        .toList();

    return filteredList;
  }

  Future<void> addRecent(AiTool tool) async {
    List<AiTool> tools = state.value ?? [];
    tools.removeWhere((item) => item.id == tool.id);
    final updatedList = [tool, ...tools].take(3).toList();
    final recentIds = updatedList.map((tool) => tool.id).toList();
    await RecentlyUsedRepository.setRecentlyUsed(recentIds);
    state = AsyncData(updatedList);
  }
}

final recentlyUsedProvider =
    AsyncNotifierProvider<RecentlyUsedNotifier, List<AiTool>>(
      RecentlyUsedNotifier.new,
    );
