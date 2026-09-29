import 'package:aistack/core/constants/spacing.dart';
import 'package:aistack/features/categories/widgets/category_card_list.dart';
import 'package:aistack/features/category_details/categories_details_screen.dart';
import 'package:aistack/features/category_details/provider/category_pricing_sort_provider.dart';
import 'package:aistack/features/home/provider/category_details_cards_provider.dart';
import 'package:aistack/features/shared/widgets/app_header.dart';
import 'package:aistack/features/shared/widgets/search_filter_bar.dart';
import 'package:aistack/features/shared/widgets/section_header.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';


class _CategorySectionConfig {
  const _CategorySectionConfig({
    required this.category,
    required this.title,
    required this.icon,
  });

  final AiCategory category;
  final String title;
  final IconData icon;
}

const List<_CategorySectionConfig> categorySections = [
  _CategorySectionConfig(
    category: AiCategory.chat,
    title: 'Chat',
    icon: LucideIcons.bot,
  ),
  _CategorySectionConfig(
    category: AiCategory.coding,
    title: 'Coding',
    icon: LucideIcons.codeXml,
  ),
  _CategorySectionConfig(
    category: AiCategory.writing,
    title: 'Writing',
    icon: LucideIcons.squarePen,
  ),
  _CategorySectionConfig(
    category: AiCategory.imgGen,
    title: 'ImgGen',
    icon: LucideIcons.image,
  ),
  _CategorySectionConfig(
    category: AiCategory.vidGen,
    title: 'VidGen',
    icon: LucideIcons.clapperboard,
  ),
  _CategorySectionConfig(
    category: AiCategory.vidEditing,
    title: 'VidEditing',
    icon: LucideIcons.scissors,
  ),
  _CategorySectionConfig(
    category: AiCategory.audio,
    title: 'Audio',
    icon: LucideIcons.audioLines,
  ),
  _CategorySectionConfig(
    category: AiCategory.design,
    title: 'Design',
    icon: LucideIcons.palette,
  ),
  _CategorySectionConfig(
    category: AiCategory.presentations,
    title: 'Presentations',
    icon: LucideIcons.presentation,
  ),
  _CategorySectionConfig(
    category: AiCategory.research,
    title: 'Research',
    icon: LucideIcons.search,
  ),
  _CategorySectionConfig(
    category: AiCategory.automation,
    title: 'Automation',
    icon: LucideIcons.workflow,
  ),
  _CategorySectionConfig(
    category: AiCategory.dataAnalytics,
    title: 'Data Analytics',
    icon: LucideIcons.chartNoAxesCombined,
  ),
  _CategorySectionConfig(
    category: AiCategory.threeDGen,
    title: '3DGen',
    icon: LucideIcons.box,
  ),
];

class _CategorySection extends ConsumerWidget {
  const _CategorySection({required this.config});

  final _CategorySectionConfig config;

  void _openCategory(BuildContext context, WidgetRef ref) {
    ref
        .read(categoryDetailsCardProvider.notifier)
        .openCategoryTools(config.category);

    ref.read(categoriesSelectedProvider.notifier).select(PricingType.all);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CategoriesDetailsScreen(category: config.category),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          leadingIcon: config.icon,
          title: config.title,
          onTap: () => _openCategory(context, ref),
        ),
        const SizedBox(height: AppSpacing.s8),
        CategoryCardList(category: config.category),
        const SizedBox(height: AppSpacing.s24),
      ],
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AppHeader(
                firstWord: 'Categories',
                subTitle: 'Find and explore the best AI models',
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),
            const SliverToBoxAdapter(child: SearchFilterBar()),
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),
            SliverList.builder(
              itemCount: categorySections.length,
              itemBuilder: (context, index) {
                return _CategorySection(config: categorySections[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
