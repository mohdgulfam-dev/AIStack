import 'package:flutter/material.dart';

class AboutTile extends StatelessWidget {
  const AboutTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconData,
  });
  final String title;
  final String subtitle;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          foregroundColor: theme.colorScheme.surfaceContainerLowest,
          child: Icon(
            iconData,
            size: 30,
            color: theme.colorScheme.primary.withValues(alpha: .9),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
