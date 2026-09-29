import 'package:flutter/material.dart';

class AppIdentityRow extends StatelessWidget {
  const AppIdentityRow({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final identityStyle = theme.textTheme.displayMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );
    return LayoutBuilder(
      builder: (context, constraint) {
        final screenWidth = constraint.maxWidth;
        return Column(
          children: [
            Image.asset('assets/about AIStack.webp', height: screenWidth * .2),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'AI',
                    style: identityStyle.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  TextSpan(
                    text: 'Stack',
                    style: identityStyle.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'All AI tools. One Place.',
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Divider(
              indent: screenWidth * .4,
              endIndent: screenWidth * .4,
              color: theme.colorScheme.primary,
              thickness: 2,
            ),
          ],
        );
      },
    );
  }
}
