import 'package:aistack/features/home/provider/category_details_cards_provider.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FilterNotifier extends Notifier<List<AiTool>> {
  @override
  List<AiTool> build() {
    final categoryDetailsCards = ref.watch(categoryDetailsCardProvider);
    return categoryDetailsCards;
  }

  void setFilter(PricingType price) {
    final baseList = ref.read(categoryDetailsCardProvider);
    if (price == PricingType.all) {
      state = baseList;
    } else {
      state = baseList.where((item) => item.pricingType == price).toList();
    }
  }
}

final categoriesPricingSortProvider =
    NotifierProvider<FilterNotifier, List<AiTool>>(FilterNotifier.new);

// selectedFilterProvider is to get to know which filter is currently selected
class SelectedNotifier extends Notifier<PricingType> {
  @override
  PricingType build() {
    return PricingType.all;
  }

  void select(PricingType type) {
    state = type;
  }
}

final categoriesSelectedProvider =
    NotifierProvider<SelectedNotifier, PricingType>(SelectedNotifier.new);
