import 'package:aistack/models/ai_tool.dart';
import 'package:aistack/models/filter_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DraftFilterNotifier extends Notifier<FilterState> {
  @override
  FilterState build() {
    return FilterState();
  }

  void toggleCategory(AiCategory category) {
    final current = {...state.selectedCategories};
    current.contains(category)
        ? current.remove(category)
        : current.add(category);
    state = state.copyWith(selectedCategories: current);
  }

  void togglePricing(PricingType price) {
    final current = {...state.pricingType};
    current.contains(price) ? current.remove(price) : current.add(price);
    state = state.copyWith(pricingType: current);
  }

  void sortType(SortType type) {
    state = state.copyWith(sortType: type);
  }

  void reset() {
    state = FilterState();
  }

  void applyForm(FilterState draft) {
    state = draft;
  }
}

final draftFilterProvider = NotifierProvider<DraftFilterNotifier, FilterState>(
  DraftFilterNotifier.new,
);
