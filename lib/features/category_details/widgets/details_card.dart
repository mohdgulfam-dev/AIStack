import 'package:aistack/features/shared/widgets/buttons/favorite_button.dart';
import 'package:aistack/features/home/provider/recently_used_provider.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aistack/core/utils/lauchTool.dart';

class CategoryDetailsCard extends ConsumerWidget {
  const CategoryDetailsCard({super.key, required this.aiTool});

  final AiTool aiTool;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final labelSmallStyle = theme.textTheme.labelSmall!.copyWith(
      color: theme.colorScheme.onSurface,
    );
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          launchTool(aiTool.websiteUrl);
          ref.read(recentlyUsedProvider.notifier).addRecent(aiTool);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child:  Image.asset(aiTool.iconPath, height: 40),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      aiTool.name,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(aiTool.description, style: labelSmallStyle),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFFBBF24),
                          size: 16,
                        ),
                        const SizedBox(width: 4),

                        Text(aiTool.rating.toString(), style: labelSmallStyle),
                        const SizedBox(width: 12),

                        Text('•', style: labelSmallStyle),
                        const SizedBox(width: 12),

                        Text(aiTool.pricingType.name, style: labelSmallStyle),
                        const SizedBox(width: 12),

                        Text('•', style: labelSmallStyle),
                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            aiTool.companyName,
                            overflow: TextOverflow.ellipsis,

                            style: labelSmallStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              FavoriteButton(tool: aiTool),
            ],
          ),
        ),
      ),
    );
  }
}
