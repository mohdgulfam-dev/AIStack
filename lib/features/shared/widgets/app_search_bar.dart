import 'package:aistack/core/constants/spacing.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, required this.onTapSearchBar, required this.text});
  final VoidCallback onTapSearchBar;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onTap: onTapSearchBar,
      backgroundColor: WidgetStatePropertyAll(
        Theme.of(context).colorScheme.surfaceContainer,
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.s16),
        ),
      ),
      leading: Icon(Icons.search),
      hintText: text,
    );
  }
}
