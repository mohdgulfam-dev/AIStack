import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/features/home/widgets/categories_card.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:aistack/core/constants/spacing.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: SizedBox(
        height: 110,
        child: ListView.separated(
          separatorBuilder: (ctx, index) => const SizedBox(width: 8),
          itemCount: AiCategory.values.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return CategoriesCard(
              category: AiCategory.values[index],
              imagePath: 'assets/icons/${AiCategory.values[index].name}.webp',
              toolCount: aiToolsData
                  .where(
                    (item) =>
                        item.categories.contains(AiCategory.values[index]),
                  )
                  .length,
            );
          },
        ),
      ),
    );
  }
}
