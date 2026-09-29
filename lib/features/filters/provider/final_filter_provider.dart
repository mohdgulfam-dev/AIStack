import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/features/filters/provider/draft_filter_provider.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:aistack/models/filter_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final finalFilterProvider = Provider<List<AiTool>>((ref) {
  List<AiTool> tools = [...aiToolsData];

  final draft = ref.watch(draftFilterProvider);
  // Filter for categories
  if (draft.selectedCategories.isNotEmpty) {
    tools.removeWhere(
      (tool) =>
          !tool.categories.any((c) => draft.selectedCategories.contains(c)),
    );
  }

  // Filter for pricingType
  if (draft.pricingType.isNotEmpty)
    tools.removeWhere((tool) => !draft.pricingType.contains(tool.pricingType));

  // Filter for SortType
  switch (draft.sortType) {
    case (SortType.alphabetical):
      tools.sort((a, b) => a.name.compareTo(b.name));
    case (SortType.highestRated):
      tools.sort((a, b) => b.rating.compareTo(a.rating));
    case (SortType.mostPopular):
      tools.sort((a, b) => b.popularity.compareTo(a.popularity));
  }

  return tools;
});
