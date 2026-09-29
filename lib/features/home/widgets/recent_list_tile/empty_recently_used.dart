import 'package:flutter/material.dart';

class EmptyRecentlyUsed extends StatelessWidget {
  const EmptyRecentlyUsed({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.history, size: 40, color: theme.colorScheme.primary),
                const SizedBox(height: 8),
                Text(
                  'No Recently Used Tools',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Recently used tools appear here',
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: theme.colorScheme.onSurface,
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
