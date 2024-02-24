import 'package:cab_express/global/cab_colors.dart';
import 'package:flutter/material.dart';

abstract class CabTheme {
  static const appBarGradientColors = <Color>[
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white70,
    Colors.white60,
    Colors.white54,
    Colors.white38,
  ];

  static ThemeData themeApp(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(color: CabColors.appBarTitle);
    return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
          backgroundColor: CabColors.primary, titleTextStyle: titleStyle),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: CabColors.primary,
        background: CabColors.backgroundHome,
      ),
    );
  }
}
