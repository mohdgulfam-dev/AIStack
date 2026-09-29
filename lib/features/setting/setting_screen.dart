import 'package:aistack/features/setting/widgets/stats_section/activity_stats.dart';
import 'package:aistack/features/setting/widgets/app_branding.dart';
import 'package:aistack/features/setting/widgets/setting_list_tile/setting_list_tile.dart';
import 'package:aistack/features/setting/widgets/theme_setting_section/app_theme_section.dart';
import 'package:aistack/features/setting/widgets/section_text.dart';
import 'package:aistack/features/shared/widgets/buttons/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SquareIconButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  iconData: LucideIcons.arrowLeft,
                ),
              ),
              const SizedBox(height: 24),
              const ActivityStats(),
              const SizedBox(height: 24),
              const SectionText(title: 'Preferences'),
              const SizedBox(height: 8),
              const AppThemeSection(),
              const SizedBox(height: 24),
              const SectionText(title: 'App'),
              const SizedBox(height: 8),
              const SettingListTile(),
              const SizedBox(height: 24),
              const AppBranding(),
            ],
          ),
        ),
      ),
    );
  }
}
