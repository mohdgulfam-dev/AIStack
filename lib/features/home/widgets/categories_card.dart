import 'package:aistack/core/utils/text_helper.dart';
import 'package:aistack/features/category_details/categories_details_screen.dart';
import 'package:aistack/features/home/provider/category_details_cards_provider.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:aistack/core/constants/spacing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesCard extends ConsumerWidget {
  const CategoriesCard({
    super.key,
    required this.category,
    required this.imagePath,
    required this.toolCount,
  });
  final AiCategory category;
  final String imagePath;
  final int toolCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void openCategoriesDetailsScreen(AiCategory category) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => CategoriesDetailsScreen(category: category),
        ),
      );
    }

    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          ref
              .read(categoryDetailsCardProvider.notifier)
              .openCategoryTools(category);
          //for categoryDetails cards as per the category
          openCategoriesDetailsScreen(category);
        },
        child: LayoutBuilder(
          builder: (context, constraint) {
            final cardWidth = (constraint.maxWidth * .23)
                .clamp(90, 110.0)
                .toDouble();
            return SizedBox(
              width: cardWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.s8,
                  vertical: AppSpacing.s8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imagePath, height: 40, fit: BoxFit.cover),
                    const SizedBox(height: AppSpacing.s8),
                    Text(
                      TextHelper.capitaliseFirstLetter(
                        category == AiCategory.threeDGen
                            ? '3DGen'
                            : category.name,
                      ),
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s4),
                    Text(
                      '$toolCount tools',
                      style: theme.textTheme.labelSmall!.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
