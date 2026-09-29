import 'package:aistack/data/about_screen_data.dart';
import 'package:aistack/features/about_screen.dart/widgets/about_tile.dart';
import 'package:flutter/material.dart';

class AboutTileList extends StatelessWidget {
  const AboutTileList({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            for (int i = 0; i < aboutScreenData.length; i++) ...[
              AboutTile(
                title: aboutScreenData[i].title,
                subtitle: aboutScreenData[i].subtitle,
                iconData: aboutScreenData[i].iconData,
              ),
              if (i < aboutScreenData.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: theme.colorScheme.primary.withValues(alpha: .2),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
