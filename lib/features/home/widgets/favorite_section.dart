import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/features/favorites/widgets/favorite_card.dart';
import 'package:aistack/features/shared/widgets/section_header.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';

class FavoriteSection extends StatelessWidget {
  const FavoriteSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(leadingIcon: Icons.star, title: 'Favorite'),
        SizedBox(height: 4,),
        SizedBox(
          height: 165,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: aiToolsData.length,
            itemBuilder: (ctx, index) {
              return FavoriteCard(
                category: AiCategory.values[index].name,
                title: aiToolsData[index].name,
                iconPath: AiCategory.values[index].name,
                description: aiToolsData[index].description,
              );
            },
          ),
        ),
        
      ],
    );
  }
}
