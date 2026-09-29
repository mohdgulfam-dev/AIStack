import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FavoriteHeader extends StatelessWidget {
  const FavoriteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Favorites',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                LucideIcons.heart,
                size: 20,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 4),

          Text(
            'Your Saved AI tools',
            style: theme.textTheme.labelSmall!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
