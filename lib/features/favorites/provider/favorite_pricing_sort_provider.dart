import 'package:aistack/features/favorites/provider/manage_favorite_provider.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class favoritePricingSort extends Notifier<List<AiTool>> {
  @override
  List<AiTool> build() {
    final favorite = ref.watch(manageFavoriteProvider);
    final favoriteTools = favorite.value ?? [];
    return favoriteTools;
  }

  void setFilter(PricingType price) {
    final favorite = ref.read(manageFavoriteProvider);
    final favoriteTools = favorite.value ?? [];
    if (price == PricingType.all) {
      state = favoriteTools;
    } else {
      state = favoriteTools.where((item) => item.pricingType == price).toList();
    }
  }
}

final FavoritePricingSortProvider =
    NotifierProvider<favoritePricingSort, List<AiTool>>(
      favoritePricingSort.new,
    );

// selectedFilterProvider is to get to know which filter is currently selected
class SelectedFavoriteFilter extends Notifier<PricingType> {
  @override
  PricingType build() {
    return PricingType.all;
  }

  void select(PricingType type) {
    state = type;
  }
}

final FavoriteSelectedProvider =
    NotifierProvider<SelectedFavoriteFilter, PricingType>(
      SelectedFavoriteFilter.new,
    );
