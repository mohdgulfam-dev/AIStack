import 'package:flutter/material.dart';

class FilterSectionHeader extends StatelessWidget {
  const FilterSectionHeader({
    super.key,
    required this.title,
    required this.iconData,
  });

  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding:const  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(iconData, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            title,
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
