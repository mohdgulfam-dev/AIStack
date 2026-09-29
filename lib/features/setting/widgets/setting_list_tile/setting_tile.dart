import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.iconData,
    required this.subTitle,
    required this.onTap,
    required this.color
  });
  final String title;
  final IconData iconData;
  final String subTitle;
  final void Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHigh.withValues(
                    alpha: .4,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8),
                child: Icon(iconData, size: 20, color: color),
              ),
            ),

            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    subTitle,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),
            Icon(Icons.chevron_right, color: theme.colorScheme.primary),
          ],
        ),
      ),
    );
  }
}
