import 'package:aistack/core/utils/text_helper.dart';
import 'package:aistack/features/category_details/categories_details_screen.dart';
import 'package:aistack/features/home/provider/recently_used_provider.dart';
import 'package:aistack/features/setting/provider/explored_provider.dart';
import 'package:aistack/features/shared/widgets/app_category_chip.dart';
import 'package:aistack/features/shared/widgets/buttons/favorite_button.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:aistack/core/constants/spacing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aistack/core/utils/lauchTool.dart';

class FavoriteCard extends ConsumerWidget {
  const FavoriteCard({super.key, required this.aiTool, this.width});

  final AiTool aiTool;
  final double? width;

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
      color: theme.colorScheme.surfaceContainerHigh,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () async {
          await launchTool(aiTool.websiteUrl);
          ref.read(exploredProvider.notifier).addExplored(aiTool);
          ref.read(recentlyUsedProvider.notifier).addRecent(aiTool);
        },
        child: SizedBox(
          width: width,

          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.s8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Image.asset(aiTool.iconPath, height: 40, fit: BoxFit.cover),

                    const SizedBox(height: AppSpacing.s8),
                    Text(
                      aiTool.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s4),
                    Text(
                      aiTool.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall!.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontSize: 9,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.s8),
                    AppCategoryChip(
                      title: TextHelper.capitaliseFirstLetter(
                        aiTool.categories.first.name,
                      ),
                      onTapFilter: () {
                        openCategoriesDetailsScreen(aiTool.categories.first);
                      },
                      color: Theme.of(
                        context,
                      ).colorScheme.surfaceContainerHighest,
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.topRight,
                child: FavoriteButton(tool: aiTool),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
