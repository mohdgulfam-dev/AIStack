import 'package:aistack/features/about_screen.dart/about_screen.dart';
import 'package:aistack/features/setting/widgets/setting_list_tile/setting_tile.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:aistack/models/profile_action.dart';
import 'package:flutter/material.dart';
import 'package:aistack/core/utils/lauchTool.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<ProfileAction> profileActionsData = [
      ProfileAction(
        title: 'Rate AIStack',
        subtitle: 'Support us with a review',
        iconData: LucideIcons.star,
        function: () {},
        color: theme.colorScheme.primary,
      ),
      ProfileAction(
        title: 'Share AIStack',
        subtitle: 'Share the app with your friends',
        iconData: LucideIcons.share2,
        function: () {},
        color: theme.colorScheme.secondary,
      ),
      ProfileAction(
        title: 'About AIStack',
        subtitle: 'Learn more about AIStack',
        iconData: LucideIcons.info,
        color: theme.colorScheme.tertiary,

        function: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (ctx) => AboutScreen()));
        },
      ),
      ProfileAction(
        title: 'Privacy Policy',
        subtitle: 'Learn how your data is handled',
        iconData: LucideIcons.shieldCheck,
        color: theme.colorScheme.primary,
        function: () {
          launchTool(
            'https://aistackprivacy.blogspot.com/2026/09/privacy-policy.html',
          );
        },
      ),
    ];

    return SingleChildScrollView(
      child:
          // Section Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  for (int i = 0; i < 4; i++) ...[
                    SettingTile(
                      onTap: profileActionsData[i].function,
                      title: profileActionsData[i].title,
                      iconData: profileActionsData[i].iconData,
                      subTitle: profileActionsData[i].subtitle,
                      color: profileActionsData[i].color,
                    ),

                    if (i < 3)
                      Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: .1),
                      ),
                  ],
                ],
              ),
            ),
          ),

      // List
    );
  }
}
