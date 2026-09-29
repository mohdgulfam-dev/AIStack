import 'package:flutter/material.dart';
import 'package:aistack/core/constants/spacing.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.onTapProfile, required this.onTapMenu});

  final VoidCallback onTapProfile;
  final VoidCallback onTapMenu;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            InkWell(
              borderRadius: BorderRadius.circular(AppSpacing.s8),
              onTap: onTapMenu,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.s4,
                  horizontal: AppSpacing.s8,
                ),
                child: Icon(Icons.menu),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "AI",
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Stack",
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Discover, organise and access the best model',
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: onTapProfile,
              icon: const CircleAvatar(radius: 15, child: Icon(Icons.person)),
            ),
          ],
        ),
    
    );
  }
}
