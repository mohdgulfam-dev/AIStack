import 'package:material_ui/material_ui.dart';

class ProfileAction {
  const ProfileAction({
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.function,
    required this.color,
  });
  final String title;
  final String subtitle;
  final IconData iconData;
  final VoidCallback function;
  final Color color;
}
