import 'package:aistack/features/home/provider/recently_used_provider.dart';
import 'package:aistack/features/home/widgets/recent_list_tile/empty_recently_used.dart';
import 'package:aistack/features/home/widgets/recent_list_tile/recent_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinalRecentTile extends ConsumerWidget {
  const FinalRecentTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentlyUsedTools = ref.watch(recentlyUsedProvider).value ?? [];
    return recentlyUsedTools.isEmpty
        ? const EmptyRecentlyUsed()
        : const RecentListTile();
  }
}
