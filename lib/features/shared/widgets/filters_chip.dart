import 'package:aistack/core/utils/text_helper.dart';
import 'package:aistack/features/category_details/provider/category_pricing_sort_provider.dart';
import 'package:aistack/features/favorites/provider/favorite_pricing_sort_provider.dart';
import 'package:aistack/features/shared/widgets/app_category_chip.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersChip extends ConsumerWidget {
  const FiltersChip({
    super.key,
    required this.isFavoriteScreen,
    required this.selectedFilter,
  });
  final bool isFavoriteScreen;
  final PricingType selectedFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 30,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            final pricingType = PricingType.values[index];
            final isSelected = selectedFilter == pricingType;
            return AppCategoryChip(
              title: TextHelper.capitaliseFirstLetter(
                PricingType.values[index].name,
              ),
              onTapFilter: () {
                if (isFavoriteScreen) {
                  ref
                      .read(FavoritePricingSortProvider.notifier)
                      .setFilter(pricingType);
                  ref
                      .read(FavoriteSelectedProvider.notifier)
                      .select(pricingType);
                } else {
                  ref
                      .read(categoriesPricingSortProvider.notifier)
                      .setFilter(pricingType);
                  ref
                      .read(categoriesSelectedProvider.notifier)
                      .select(pricingType);
                }
              },
              changeColor: isSelected,
              color: isSelected
                  ? theme.colorScheme.primary.withValues(alpha: .5)
                  : theme.colorScheme.surfaceContainerHighest,
            );
          },
          separatorBuilder: (ctx, index) => const SizedBox(width: 8),
          itemCount: PricingType.values.length,
        ),
      ),
    );
  }
}
