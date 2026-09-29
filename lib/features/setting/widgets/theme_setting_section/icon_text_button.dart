import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.title,
    required this.iconData,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final IconData iconData;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgGroundColor = isSelected
        ? theme.colorScheme.surfaceContainerLow
        : Colors.transparent;
    final foreGroundColor = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurface;

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgGroundColor,
          border: BoxBorder.all(
            color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: foreGroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
