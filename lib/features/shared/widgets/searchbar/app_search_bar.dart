import 'package:aistack/core/constants/spacing.dart';
import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/features/category_details/widgets/details_card.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final searchControllerr = SearchController();
  @override
  void dispose() {
    searchControllerr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SearchAnchor.bar(
      constraints: const BoxConstraints(minHeight: 40),
      searchController: searchControllerr,
      suggestionsBuilder: (context, searchControllerr) {
        if (searchControllerr.text.isEmpty) {
          return [];
        } else {
          return aiToolsData
              .where(
                (item) => item.name.toLowerCase().contains(
                  searchControllerr.text.toLowerCase().trim(),
                ),
              )
              .map((item) => CategoryDetailsCard(aiTool: item));
        }
      },
      barHintText: "Search AI tools",
      viewLeading: IconButton(
        onPressed: () {
          searchControllerr.closeView('');
        },
        icon: Icon(Icons.arrow_back_rounded),
      ),
      barLeading: Icon(Icons.search),
      barElevation: WidgetStatePropertyAll(0),
      barBackgroundColor: WidgetStatePropertyAll(
        theme.colorScheme.surfaceContainerHigh.withValues(alpha: .5),
      ),
      barShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.s12),
        ),
      ),
    );
  }
}
