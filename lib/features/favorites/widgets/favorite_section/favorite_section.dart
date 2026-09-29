import 'package:aistack/features/favorites/provider/favorite_pricing_sort_provider.dart';
import 'package:aistack/features/shared/widgets/card/empty_favorite.dart';
import 'package:aistack/features/shared/widgets/card/favorite_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteSection extends ConsumerWidget {
  const FavoriteSection({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteList = ref.watch(FavoritePricingSortProvider);
    if (favoriteList.isEmpty) {
      return const SliverToBoxAdapter(child: EmptyFavorite());
    } else {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: favoriteList.length,
            (ctx, index) => FavoriteCard(aiTool: favoriteList[index]),
          ),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
        ),
      );
    }
  }
}
