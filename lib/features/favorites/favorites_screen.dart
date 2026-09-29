import 'package:aistack/features/favorites/provider/favorite_pricing_sort_provider.dart';
import 'package:aistack/features/shared/widgets/filters_chip.dart';
import 'package:aistack/features/favorites/widgets/favorite_header.dart';
import 'package:aistack/features/favorites/widgets/favorite_count.dart';
import 'package:aistack/features/favorites/widgets/favorite_section/favorite_section.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFitler = ref.watch(FavoriteSelectedProvider);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: FavoriteHeader()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(child: FavoriteCount()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: FiltersChip(
                isFavoriteScreen: true,
                selectedFilter: selectedFitler,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const FavoriteSection(),
          ],
        ),
      ),
    );
  }
}
