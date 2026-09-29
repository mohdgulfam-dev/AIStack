import 'package:aistack/core/utils/text_helper.dart';
import 'package:aistack/features/categories/widgets/category_chip.dart';
import 'package:aistack/features/favorites/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:aistack/core/constants/spacing.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.description,
    required this.category,
  });
  final String title;
  final String iconPath;
  final String description;
  final String category;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return SizedBox(
      width: (screenWidth * .25).clamp(90.0, 110.0) * 1.33,
      child: Card(
               child: Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.s8,
            left: AppSpacing.s8,
            right: AppSpacing.s8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Image.asset(
                    'assets/icons/$iconPath.png',
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  Spacer(),
                  FavoriteButton(),
                ],
              ),
              SizedBox(height: AppSpacing.s8),
              Text(
                title,
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSpacing.s4),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                TextHelper.wrapWords(description, 3),
                style: theme.textTheme.labelSmall!.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontSize: 9,
                ),
              ),

              CategoryChip(title: category),
            ],
          ),
        ),
      ),
    );
  }
}
