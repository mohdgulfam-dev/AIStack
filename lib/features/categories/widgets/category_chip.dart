import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      shape: RoundedRectangleBorder(side: BorderSide(width: .5, color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(20), ),
      backgroundColor: theme.colorScheme.surfaceContainer,
      label: Text(
        title,
        style: theme.textTheme.labelSmall!.copyWith(
          color: theme.colorScheme.primary,
         
        ),
      ),
      labelPadding: EdgeInsets.zero,
    );
  }
}
