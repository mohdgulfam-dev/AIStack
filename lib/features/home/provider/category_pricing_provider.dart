import 'package:aistack/features/home/provider/category_details_cards_provider.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterNotifier extends Notifier<List<AiTool>> {
  @override
  List<AiTool> build() {
    final categoryDetailsCards = ref.watch(categoryDetailsCardProvider);
    return categoryDetailsCards;
  }

  void setFilter(PricingType price) {}
}

final categoryPricingSortProvider =
    NotifierProvider<FilterNotifier, List<AiTool>>(FilterNotifier.new);

// selectedFilterProvider is to get to know which filter is currently selected
class SelectedNotifier extends Notifier<PricingType?> {
  @override
  PricingType? build() {
    return PricingType.all;
  }

  void select(PricingType type) {
    state = type;
  }
}

final selectedFilterProvider = NotifierProvider<SelectedNotifier, PricingType?>(
  SelectedNotifier.new,
);
