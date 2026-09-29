import 'package:aistack/features/favorites/provider/manage_favorite_provider.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({super.key, required this.tool});
  final AiTool tool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      manageFavoriteProvider.select((state) {
        final favorites = state.value ?? [];
        return favorites.contains(tool);
      }),
    );
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            ref
                .read(manageFavoriteProvider.notifier)
                .manageFavorite(tool, context);
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isFavorite
                  ? Icon(
                      key: ValueKey(isFavorite),
                      Icons.favorite,
                      size: 20,
                      color: theme.colorScheme.onSurface.withValues(alpha: .75),
                    )
                  : Icon(
                      key: ValueKey(isFavorite),
                      Icons.favorite_outline,
                      size: 20,
                      color: theme.colorScheme.onSurface.withValues(alpha: .75),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
