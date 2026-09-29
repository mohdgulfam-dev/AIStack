import 'package:aistack/features/setting/provider/theme_provider.dart';
import 'package:aistack/features/setting/widgets/theme_setting_section/icon_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AppThemeSection extends ConsumerWidget {
  const AppThemeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(themeProvider);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.surfaceContainerLow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: theme.colorScheme.surfaceContainerHigh.withValues(
                        alpha: .4,
                      ),
                    ),
                    child: Icon(
                      LucideIcons.moon,

                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Appearance',
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),

                      Text(
                        'Choose your preferred theme',
                        style: theme.textTheme.labelSmall!.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: theme.colorScheme.surfaceContainerHigh.withValues(
                    alpha: .4,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: IconTextButton(
                        title: 'Light',
                        iconData: LucideIcons.sun,
                        isSelected: selectedTheme == ThemeMode.light,
                        onTap: () {
                          ref.read(themeProvider.notifier).state =
                              ThemeMode.light;
                        },
                      ),
                    ),
                    Expanded(
                      child: IconTextButton(
                        title: 'Dark',
                        iconData: LucideIcons.moon,
                        isSelected: selectedTheme == ThemeMode.dark,
                        onTap: () {
                          ref.read(themeProvider.notifier).state =
                              ThemeMode.dark;
                        },
                      ),
                    ),
                    Expanded(
                      child: IconTextButton(
                        title: 'System',
                        iconData: LucideIcons.monitor,
                        isSelected: selectedTheme == ThemeMode.system,
                        onTap: () {
                          ref.read(themeProvider.notifier).state =
                              ThemeMode.system;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
