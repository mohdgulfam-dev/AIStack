import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

const currentTheme = ThemeMode.system;
final themeProvider = StateProvider<ThemeMode>((ref) {
  return currentTheme;
});
