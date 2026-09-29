import 'package:aistack/core/constants/radius.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 49, 10, 156),
  brightness: Brightness.dark,
);

final kColorSchemeLight = ColorScheme.fromSeed(
  seedColor: const Color(0xFF8B5CF6),
);

class AppTheme {
  static ThemeData darkTheme =
      ThemeData.from(
        colorScheme: kColorSchemeDark,
        textTheme: GoogleFonts.interTextTheme(),
      ).copyWith(
        cardTheme: CardThemeData(
          color: kColorSchemeDark.surfaceContainerHigh.withValues(alpha: .5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r12),
          ),
        ),
      );
  static ThemeData lightTheme =
      ThemeData.from(
        colorScheme: kColorSchemeLight,
        textTheme: GoogleFonts.interTextTheme(),
      ).copyWith(
        cardTheme: CardThemeData(
          color: kColorSchemeLight.surfaceContainerHigh.withValues(alpha: .5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r12),
          ),
          clipBehavior: Clip.hardEdge,
        ),
      );
}
