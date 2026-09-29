import 'package:aistack/features/favorites/provider/manage_favorite_provider.dart';
import 'package:aistack/features/shared/widgets/card/empty_favorite.dart';
import 'package:aistack/features/shared/widgets/card/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteToolsList extends ConsumerWidget {
  const FavoriteToolsList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteToolList = ref.watch(manageFavoriteProvider).value ?? [];

    if (favoriteToolList.isEmpty) {
      return SliverToBoxAdapter(child: const  EmptyFavorite());
    } else {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(
            builder: (context, constraint) {
              final width =
                  (constraint.maxWidth * .225).clamp(90.0, 110.0) * 1.33;
              return SizedBox(
                height: 165,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => FavoriteCard(
                    aiTool: favoriteToolList[index],
                    width: width,
                  ),
                  separatorBuilder: (_, _) => const SizedBox(width: 4),
                  itemCount: favoriteToolList.length,
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
