import 'package:aistack/features/category_details/widgets/details_card.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';

class CardsInCategories extends StatelessWidget {
  const CardsInCategories({super.key, required this.tools});
  final List<AiTool> tools;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: tools.length,
          (ctx, index) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: CategoryDetailsCard(aiTool: tools[index]),
          ),
        ),
      ),
    );
  }
}
