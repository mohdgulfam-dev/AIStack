import 'package:aistack/features/filters/filter_result_screen/filter_result_screen.dart';
import 'package:aistack/features/filters/provider/draft_filter_provider.dart';
import 'package:aistack/features/filters/widgets/filter_header.dart';
import 'package:aistack/features/filters/widgets/list_tiles/category_filter_list_tile.dart';
import 'package:aistack/features/filters/widgets/list_tiles/pricing_list_tile.dart';
import 'package:aistack/features/filters/widgets/list_tiles/sortBy_list.dart';
import 'package:aistack/features/filters/widgets/filter_section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: const Column(
            children: [
              FilterHeader(),
              FilterSectionHeader(
                iconData: LucideIcons.layoutGrid,
                title: 'Categories',
              ),

              FilterListTile(),
              SizedBox(height: 24),
              FilterSectionHeader(title: 'Pricing', iconData: LucideIcons.tag),
              PricingListTile(),
              SizedBox(height: 24),

              FilterSectionHeader(
                title: 'Sort By',
                iconData: LucideIcons.moveVertical,
              ),
              ProfileSortByList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 50,
            child: FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => FilterResultScreen()),
                  // (route) => route.isFirst,
                );
                ref
                    .read(draftFilterProvider.notifier)
                    .applyForm(ref.read(draftFilterProvider));
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  theme.colorScheme.primary,
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              child: Text(
                'Apply Filters',
                style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
