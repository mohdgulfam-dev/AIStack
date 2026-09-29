import 'package:aistack/features/setting/widgets/stats_section/activity_stats.dart';
import 'package:flutter/material.dart';

class ProfileStats {
  const ProfileStats({
    required this.title,
    required this.count,
    required this.statType,
    required this.iconData,
  });
  final String title;
  final int count;
  final StatType statType;
  final IconData iconData;
}
