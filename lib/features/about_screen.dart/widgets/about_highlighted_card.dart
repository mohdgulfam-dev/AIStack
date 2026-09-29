import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AboutHighlightedCard extends StatelessWidget {
  const AboutHighlightedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child:  Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color:  theme.colorScheme.primary.withValues(alpha: .8),
          ),
        ),
        color: theme.colorScheme.surfaceContainerLow.withValues(alpha: .3),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                LucideIcons.heart,
                size: 40,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    style: theme.textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text:
                            'Instead of searching across dozens of websites, AIStack helps you discover the right AI tool',
                        style: TextStyle(color: theme.colorScheme.onSurface),
                      ),
                      TextSpan(
                        text: ' in seconds',
                        style: TextStyle(color: theme.colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
