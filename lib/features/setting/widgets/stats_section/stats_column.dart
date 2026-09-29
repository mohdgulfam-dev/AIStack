import 'package:flutter/material.dart';

class StatsColumn extends StatelessWidget {
  const StatsColumn({
    super.key,
    required this.iconData,
    required this.count,
    required this.title,
    required this.color,
  });
  final IconData iconData;
  final int count;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: color.withValues(alpha: .4),
          child: Icon(iconData, size: 25, color: color.withValues(alpha: 2)),
        ),
        SizedBox(height: 8),
        Text(
          count.toString(),
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: theme.textTheme.titleSmall!.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
