import 'package:aistack/features/filters/provider/draft_filter_provider.dart';
import 'package:aistack/features/shared/widgets/buttons/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FilterHeader extends ConsumerWidget {
  const FilterHeader({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              SquareIconButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                iconData: LucideIcons.arrowLeft,
              ),

              const Spacer(),
              Text(
                'Filters',
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const Spacer(),

              FilledButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    theme.colorScheme.surfaceContainerHigh.withValues(
                      alpha: .4,
                    ),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {
                  ref.read(draftFilterProvider.notifier).reset();
                },
                child: Text(
                  'Reset',
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8,),
          Divider(color: theme.colorScheme.primary.withValues(alpha: .2)),
        ],
      ),
    );
  }
}
