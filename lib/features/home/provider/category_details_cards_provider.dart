import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDetailsCardsProvider extends Notifier<List<AiTool>> {
  @override
  List<AiTool> build() {
    return [];
  }

  void openCategoryTools(AiCategory category) {
    state = categoriesToolMap[category] ?? [];
  }
}

final categoryDetailsCardProvider =
    NotifierProvider<CategoryDetailsCardsProvider, List<AiTool>>(
      CategoryDetailsCardsProvider.new,
    );
