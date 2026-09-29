import 'package:aistack/features/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:aistack/core/constants/spacing.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,

    required this.firstWord,
    this.secondWord,
    required this.subTitle,
  });

  final String firstWord;
  final String? secondWord;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: firstWord,
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (secondWord != null)
                        TextSpan(
                          text: secondWord,
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.s4),
                Text(
                  subTitle,
                  style: theme.textTheme.labelSmall!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          CircleAvatar(
            radius: 20,
            backgroundColor: theme.colorScheme.surfaceContainerHigh.withValues(
              alpha: .5,
            ),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const SettingScreen()),
                );
              },
              child: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }
}
