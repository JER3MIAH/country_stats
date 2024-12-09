import 'package:country_stats/src/features/theme/data/colors.dart';
import 'package:country_stats/src/shared/shared.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: appColors.lightModeBackground,
  textTheme: TextTheme().apply(fontFamily: PlusJakartaSans),
  colorScheme: ColorScheme.light(
    surface: appColors.lightModeBackground,
    inverseSurface: appColors.white,
    onSurface: appColors.lightModeText,
    primary: appColors.white,
    onPrimary: appColors.white,
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: appColors.darkModeBackground,
  textTheme: TextTheme().apply(fontFamily: PlusJakartaSans),
  colorScheme: ColorScheme.dark(
    surface: appColors.darkModeBackground,
    inverseSurface: appColors.black,
    onSurface: appColors.white,
    primary: appColors.darkBlue,
    onPrimary: appColors.white,
  ),
);
