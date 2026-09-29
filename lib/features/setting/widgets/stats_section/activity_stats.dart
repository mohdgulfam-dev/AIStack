import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/features/favorites/provider/manage_favorite_provider.dart';
import 'package:aistack/features/setting/provider/explored_provider.dart';
import 'package:aistack/features/setting/widgets/stats_section/stats_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aistack/models/profile_stats.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum StatType { favorite, explored, tools }

class ActivityStats extends ConsumerWidget {
  const ActivityStats({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite = ref.watch(manageFavoriteProvider);
    final favoriteValue = favorite.value ?? [];
    final favoriteCount = favoriteValue.length;
    final exploredNumber = ref.watch(exploredProvider).value ?? 0;

    final List<ProfileStats> profileStatsData  =  [
      ProfileStats(
        title: 'Favorites',
        count: favoriteCount,
        statType: StatType.favorite,
        iconData: LucideIcons.heart,
      ),
      ProfileStats(
        title: 'Explored',
        count: exploredNumber,
        statType: StatType.explored,
        iconData: LucideIcons.bot,
      ),
      ProfileStats(
        title: 'Tools',
        count: aiToolsData.length,
        statType: StatType.tools,
        iconData: LucideIcons.blocks,
      ),
    ];
    final color = Theme.of(context).colorScheme.primary;
    Color getColor(StatType type) {
      switch (type) {
        case StatType.favorite:
          return color.withValues(red: .5);
        case StatType.explored:
          return color.withValues(green: .5);
        case StatType.tools:
          return color.withValues(green: .5, red: .5);
      }
    }

    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                for (int i = 0; i < profileStatsData .length; i++) ...[
                  Expanded(
                    child: StatsColumn(
                      iconData: profileStatsData [i].iconData,
                      count: profileStatsData [i].count,
                      title: profileStatsData [i].title,
                      color: getColor(profileStatsData [i].statType),
                    ),
                  ),
                  if (i < profileStatsData .length - 1)
                    VerticalDivider(
                      indent: 8,
                      endIndent: 8,
                      color: theme.colorScheme.primary.withValues(alpha: .2),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
