import 'package:aistack/features/home/provider/recently_used_provider.dart';
import 'package:aistack/features/home/widgets/recent_list_tile/recent_single_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecentListTile extends ConsumerWidget {
  const RecentListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentlyUsedTools = ref.watch(recentlyUsedProvider).value ?? [];
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Column(
          children: [
            for (int i = 0; i < recentlyUsedTools.length; i++) ...[
              RecentSingleTile(tool: recentlyUsedTools[i]),
              if (i < recentlyUsedTools.length - 1)
                Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 2,
                  color: theme.colorScheme.primary.withValues(alpha: .1),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
