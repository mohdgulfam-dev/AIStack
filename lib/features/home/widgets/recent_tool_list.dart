import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/features/home/widgets/recent_toll.dart';
import 'package:aistack/features/shared/widgets/section_header.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';

class RecentToolList extends StatelessWidget {
  const RecentToolList({super.key});

  @override
  Widget build(BuildContext context) {
        return SliverMainAxisGroup(
      slivers: [
        // Section Header
        SliverToBoxAdapter(
          child: SectionHeader(
            leadingIcon: Icons.history,
            title: "Recently Used",
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: .2),
                ),
              ),
              child: Column(
                children: [
                  for (int i = 0; i < 3; i++) ...[
                    RecentToolCard(
                      title: aiToolsData[i].name,
                      logoName: AiCategory.values[i].name,
                      subTitle: aiToolsData[i].description,
                      time: 2,
                    ),
                    if (i < 2)
                      Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: .1),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),

        // List
      ],
    );
  }
}
