import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AppBranding extends StatelessWidget {
  const AppBranding({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Icon(LucideIcons.layers, color: theme.colorScheme.primary),
          const SizedBox(height: 4),
          Text(
            'AIStack',
            style: theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),

          Text(
            'Version 1.0.0',
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
