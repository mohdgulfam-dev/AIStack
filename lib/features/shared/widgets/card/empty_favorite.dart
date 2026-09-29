import 'package:aistack/core/utils/text_helper.dart';
import 'package:aistack/features/navigation/provider/pages_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EmptyFavorite extends ConsumerWidget {
  const EmptyFavorite({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  LucideIcons.heart,
                  size: 40,
                  color: theme.colorScheme.primary,
                ),

                const SizedBox(height: 4),
                Text(
                  'No favorites yet',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  TextHelper.wrapWords('Tap the heart to save favorites.', 7),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                FilledButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      theme.colorScheme.surfaceContainerHigh.withValues(
                        alpha: .4,
                      ),
                    ),
                  ),
                  onPressed: () {
                    ref
                        .read(pagesProvider.notifier)
                        .openScreens(NavPage.categories);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                        Text(
                          'Explore Tools',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleSmall!.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                    
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
