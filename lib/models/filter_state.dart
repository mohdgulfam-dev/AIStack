import 'package:aistack/models/ai_tool.dart';

enum SortType { mostPopular, highestRated, alphabetical }

class FilterState {
  const FilterState({
    this.selectedCategories = const {},
    this.pricingType = const {},

    this.sortType = SortType.mostPopular,
  });
  final Set<AiCategory> selectedCategories;
  final Set<PricingType> pricingType;
  final SortType sortType;

  FilterState copyWith({
    Set<AiCategory>? selectedCategories,
   Set<PricingType>? pricingType,
    SortType? sortType,
  }) {
    return FilterState(
      selectedCategories: selectedCategories ?? this.selectedCategories,
      pricingType: pricingType ?? this.pricingType,
      sortType: sortType ?? this.sortType,
    );
  }
}
