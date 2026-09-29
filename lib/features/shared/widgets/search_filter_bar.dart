import 'package:aistack/features/filters/filter_screen.dart';
import 'package:aistack/features/shared/widgets/searchbar/app_search_bar.dart';
import 'package:aistack/features/shared/widgets/buttons/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:aistack/core/constants/spacing.dart';

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: const AppSearchBar()),
          const SizedBox(width: AppSpacing.s8),
          SquareIconButton(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => FilterScreen()));
            },
            iconData: Icons.tune_rounded,
          ),
        ],
      ),
    );
  }
}
