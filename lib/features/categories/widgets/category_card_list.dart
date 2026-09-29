import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/features/categories/widgets/category_card.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:aistack/core/constants/spacing.dart';

class CategoryCardList extends StatelessWidget {
  const CategoryCardList({super.key, required this.category});
  final AiCategory category;

  @override
  Widget build(BuildContext context) {
    final tools = categoryToolMap[category] ?? [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: SizedBox(
        height: 130,
        child: ListView.separated(
          separatorBuilder: (ctx, index) => const SizedBox(width: 8),
          itemCount: tools.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return CategoryCard(aiTool: tools[index], width: 130.0);
          },
        ),
      ),
    );
  }
}
