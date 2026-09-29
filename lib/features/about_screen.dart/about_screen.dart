import 'package:aistack/features/about_screen.dart/widgets/about_highlighted_card.dart';
import 'package:aistack/features/about_screen.dart/widgets/about_tile_list.dart';

import 'package:aistack/features/about_screen.dart/widgets/app_identity_row.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About AIStack',
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: const Column(
          children: [
            AppIdentityRow(),
            SizedBox(height: 24),
            AboutTileList(),
            SizedBox(height: 24),
            AboutHighlightedCard(),
          ],
        ),
      ),
    );
  }
}
