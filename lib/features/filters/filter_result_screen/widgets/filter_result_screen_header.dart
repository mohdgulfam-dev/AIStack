import 'package:aistack/features/filters/filter_screen.dart';
import 'package:aistack/features/filters/provider/final_filter_provider.dart';
import 'package:aistack/features/shared/widgets/buttons/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FilterResultScreenHeader extends ConsumerWidget {
  const FilterResultScreenHeader({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTools = ref.watch(
      finalFilterProvider.select((tools) => tools.length),
    );
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SquareIconButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            iconData: LucideIcons.arrowLeft,
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                '$filteredTools Tools Found',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Based on your filters',
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const Spacer(),
          SquareIconButton(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => FilterScreen()));
            },
            iconData: LucideIcons.filter,
            iconColor: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
