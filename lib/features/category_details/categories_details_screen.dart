import 'package:aistack/features/category_details/provider/category_pricing_sort_provider.dart';
import 'package:aistack/features/category_details/widgets/category_details_header.dart';
import 'package:aistack/features/category_details/widgets/details_card_list.dart';
import 'package:aistack/features/shared/widgets/filters_chip.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesDetailsScreen extends ConsumerWidget {
  const CategoriesDetailsScreen({super.key, required this.category});
  final AiCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredList = ref.watch(categoriesPricingSortProvider);
    final selectedFilter = ref.watch(categoriesSelectedProvider);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoryDetailsHeader(category: category),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: FiltersChip(
                isFavoriteScreen: false,
                selectedFilter: selectedFilter,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            CardsInCategories(tools: filteredList),
          ],
        ),
      ),
    );
  }
}
