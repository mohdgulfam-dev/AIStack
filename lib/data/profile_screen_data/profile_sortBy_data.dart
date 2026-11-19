import 'package:aistack/models/filter_state.dart';
import 'package:material_ui/material_ui.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

const Map<SortType, IconData> profileSortMap = {
  SortType.mostPopular: LucideIcons.flame,
  SortType.highestRated: LucideIcons.star,
  SortType.alphabetical: LucideIcons.arrowUpAZ,
};
