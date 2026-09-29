import 'package:aistack/features/categories/categories_screen.dart';
import 'package:aistack/features/favorites/favorites_screen.dart';
import 'package:aistack/features/home/home_screen.dart';
import 'package:aistack/features/navigation/provider/pages_provider.dart';
import 'package:aistack/features/navigation/widgets/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainNavigationScreen extends ConsumerWidget {
  const MainNavigationScreen({super.key});
  final pages = const [HomeScreen(), CategoriesScreen(), FavoritesScreen()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(pagesProvider);

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(pagesProvider.notifier).setNavigationScreen(index);
        },
      ),
    );
  }
}
