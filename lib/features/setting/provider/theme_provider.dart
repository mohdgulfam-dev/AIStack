import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/legacy.dart';

const currentTheme = ThemeMode.system;
final themeProvider = StateProvider<ThemeMode>((ref) {
  return currentTheme;
});
