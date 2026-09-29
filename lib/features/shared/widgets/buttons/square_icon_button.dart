import 'package:flutter/material.dart';

class SquareIconButton extends StatelessWidget {
  const SquareIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
    this.iconColor,
  });
  final VoidCallback onTap;
  final IconData iconData;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: theme.colorScheme.surfaceContainerHigh.withValues(alpha: .5),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(iconData, color: iconColor),
        ),
      ),
    );
  }
}
