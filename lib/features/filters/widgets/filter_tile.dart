import 'package:aistack/features/filters/widgets/filter_checkbox.dart';
import 'package:flutter/material.dart';

class FilterTile extends StatelessWidget {
  const FilterTile({
    super.key,
    required this.category,
    required this.iconData,
    required this.setFilter,
    required this.value,
  });
  final dynamic category;
  final IconData iconData;
  final VoidCallback setFilter;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: setFilter,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: theme.colorScheme.surfaceContainerHigh.withValues(
                alpha: .4,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Icon(iconData, size: 15, color: theme.colorScheme.primary),
            ),
          ),

         const SizedBox(width: 8),
          Text(
            category,
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
         const  Spacer(),
         FilterCheckbox(isSelected: value),
        ],
      ),
    );
  }
}
