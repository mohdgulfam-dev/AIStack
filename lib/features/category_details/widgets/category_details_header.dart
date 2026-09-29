import 'package:aistack/core/utils/text_helper.dart';
import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/features/shared/widgets/buttons/square_icon_button.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';

class CategoryDetailsHeader extends StatelessWidget {
  const CategoryDetailsHeader({super.key, required this.category});
  final AiCategory category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SquareIconButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            iconData: Icons.arrow_back_rounded,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextHelper.capitaliseFirstLetter(category.name),
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  categoryDescriptions[category]!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
