import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.seeAll = true,
    this.onTap,
  });
  final IconData leadingIcon;
  final String title;
  final bool seeAll;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 28,
        child: Row(
          children: [
            Icon(leadingIcon, size: 20),
            const SizedBox(width: 8),

            Text(
              title,
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const Spacer(),

            if (seeAll)
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: onTap,
                child: Row(
                  children: [
                    Text(
                      'See all',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Icon(
                      Icons.chevron_right,
                      size: 14,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
