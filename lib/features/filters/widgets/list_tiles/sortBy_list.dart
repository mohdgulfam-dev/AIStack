import 'package:aistack/core/utils/text_helper.dart';
import 'package:aistack/data/profile_screen_data/profile_sortBy_data.dart';
import 'package:aistack/features/filters/provider/draft_filter_provider.dart';
import 'package:aistack/features/filters/widgets/filter_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileSortByList extends ConsumerWidget {
  const ProfileSortByList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(draftFilterProvider);
    final draftNotifier = ref.read(draftFilterProvider.notifier);

    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHigh.withValues(alpha: .4),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              for (int i = 0; i < profileSortMap.length; i++) ...[
                FilterTile(
                  setFilter: () =>
                      draftNotifier.sortType(profileSortMap.keys.elementAt(i)),
                  value: draft.sortType == profileSortMap.keys.elementAt(i),
                  category: TextHelper.capitaliseFirstLetter(
                    profileSortMap.keys.elementAt(i).name,
                  ),

                  iconData: profileSortMap.values.elementAt(i),
                ),
                if (i < profileSortMap.length - 1)
                  Divider(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: .1),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
