import 'package:flutter/material.dart';

class ProfileAction {
  const ProfileAction({
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.function,
    required this.color
  });
  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback function;
  final Color color;
}
