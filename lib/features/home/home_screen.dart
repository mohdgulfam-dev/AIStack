import 'package:aistack/features/home/widgets/home_favorite_section/home_favorite_tools_list.dart';
import 'package:aistack/features/home/widgets/recent_list_tile/final_recent_tile.dart';
import 'package:aistack/features/navigation/provider/pages_provider.dart';
import 'package:aistack/features/shared/widgets/search_filter_bar.dart';
import 'package:aistack/features/shared/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:aistack/features/home/widgets/categories_section.dart';
import 'package:aistack/features/shared/widgets/app_header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AppHeader(
                firstWord: "AI",
                secondWord: 'Stack',
                subTitle: 'Discover, organise and access the best model',
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(child: SearchFilterBar()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: SectionHeader(
                leadingIcon: LucideIcons.layoutGrid,
                title: "Categories",
                onTap: () {
                  ref
                      .read(pagesProvider.notifier)
                      .openScreens(NavPage.categories);
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            // Categories
            const SliverToBoxAdapter(child: CategoriesSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: SectionHeader(
                leadingIcon: Icons.favorite,
                title: 'Favorite',
                onTap: () {
                  ref
                      .read(pagesProvider.notifier)
                      .openScreens(NavPage.favorite);
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            const FavoriteToolsList(),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(
              child: SectionHeader(
                leadingIcon: LucideIcons.history,
                title: 'Recently Used',
                seeAll: false,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            const SliverToBoxAdapter(child: FinalRecentTile()),
          ],
        ),
      ),
    );
  }
}
