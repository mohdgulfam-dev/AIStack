import 'package:aistack/features/category_details/widgets/details_card_list.dart';
import 'package:aistack/features/filters/filter_result_screen/widgets/filter_result_screen_header.dart';
import 'package:aistack/features/filters/provider/final_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterResultScreen extends ConsumerWidget {
  const FilterResultScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredList = ref.watch(finalFilterProvider);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: FilterResultScreenHeader()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            CardsInCategories(tools: filteredList),
          ],
        ),
      ),
    );
  }
}
