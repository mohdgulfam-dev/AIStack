import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        height: 90,
        backgroundColor: theme.colorScheme.surfaceContainer,
        labelTextStyle: WidgetStateTextStyle.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            );
          }
          return TextStyle(color: theme.colorScheme.onSurface);
        }),
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,

        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),

            label: "Categories",
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),

            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
