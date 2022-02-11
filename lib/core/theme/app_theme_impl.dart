import 'package:flutter/material.dart';
import 'package:newspaper/core/theme/base_colors.dart';

import 'app_theme.dart';

/// Implementation for app material theme.
class AppThemeImpl implements AppTheme {
  // TODO(Any): Specify dark theme.
  @override
  ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: BaseColors.materialBlack,
      brightness: Brightness.dark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
      ),
      backgroundColor: BaseColors.black,
      cardColor: BaseColors.white,
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: BaseColors.neutral100,
      ),
    );
  }

  // TODO(Any): Specify light theme.
  @override
  ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: BaseColors.materialPrimary,
      brightness: Brightness.light,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
      ),
      backgroundColor: BaseColors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: BaseColors.white,
        unselectedItemColor: BaseColors.white.withOpacity(.6),
        type: BottomNavigationBarType.fixed,
      ),
      listTileTheme: const ListTileThemeData(dense: true),
      cardColor: BaseColors.primary,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: BaseColors.white,
      ),
    );
  }
}
