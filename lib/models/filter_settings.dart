import 'package:aistack/models/ai_tool.dart';

enum SortType { popular, rating }

class FilterSettings {
  const FilterSettings({
    this.selectedCategories = const {},
    this.pricingType,
    this.openSourceOnly = false,
    this.mobileAppOnly = false,
    this.sortType = SortType.popular,
  });
  final Set<AiCategory> selectedCategories;
  final PricingType? pricingType;
  final bool openSourceOnly;
  final bool mobileAppOnly;
  final SortType sortType;

  FilterSettings copyWith({
    Set<AiCategory>? selectedCategories,
    PricingType? pricingType,
    bool? openSourceOnly,
    bool? mobileAppOnly,
    SortType? sortType,
  }) {
    return FilterSettings(
      selectedCategories: selectedCategories ?? this.selectedCategories,
      pricingType: pricingType ?? this.pricingType,
      openSourceOnly: openSourceOnly ?? this.openSourceOnly,
      mobileAppOnly: mobileAppOnly ?? this.mobileAppOnly,
      sortType: sortType ?? this.sortType,
    );
  }
}
