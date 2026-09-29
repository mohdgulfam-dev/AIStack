import 'package:aistack/core/utils/text_helper.dart';
import 'package:flutter/material.dart';

class RecentToolCard extends StatelessWidget {
  const RecentToolCard({
    super.key,
    required this.title,
    required this.logoName,
    required this.subTitle,
    required this.time,
  });
  final String title;
  final String logoName;
  final String subTitle;
  final int time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/icons/$logoName.png', height: 40,),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    TextHelper.wrapWords(subTitle, 4),
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              '${time.toString()}h ago',
              style: theme.textTheme.labelSmall!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.chevron_right, color: theme.colorScheme.primary),
          ],
        ),
      
    );
  }
}
