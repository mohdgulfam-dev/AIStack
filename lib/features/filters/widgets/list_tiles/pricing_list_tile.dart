import 'package:aistack/core/utils/text_helper.dart';
import 'package:aistack/data/profile_screen_data/profile_pricing.dart';
import 'package:aistack/features/filters/provider/draft_filter_provider.dart';
import 'package:aistack/features/filters/widgets/filter_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PricingListTile extends ConsumerWidget {
  const PricingListTile({super.key});
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
              for (int i = 0; i < profilePricingMap.length; i++) ...[
                FilterTile(
                  value: draft.pricingType.contains(
                    profilePricingMap.keys.elementAt(i),
                  ),

                  setFilter: () => draftNotifier.togglePricing(
                    profilePricingMap.keys.elementAt(i),
                  ),

                  category: TextHelper.capitaliseFirstLetter(
                    profilePricingMap.keys.elementAt(i).name,
                  ),
                  iconData: profilePricingMap.values.elementAt(i),
                ),
                if (i < profilePricingMap.length - 1)
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
