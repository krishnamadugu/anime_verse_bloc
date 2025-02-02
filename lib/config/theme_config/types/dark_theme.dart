import 'package:flutter/material.dart';

import '../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../ui_theme/app_bar_theme.dart';
import '../ui_theme/input_decoration_theme.dart';
import '../ui_theme/text_theme.dart';

class DarkTheme {
  static final ThemeData kThemeConfig = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.blackColor,
    textTheme: AppTextTheme.defaultTextTheme,
    inputDecorationTheme: AppInputDecorationTheme.kInputDecorationTheme,
    appBarTheme: AppsAppBarTheme.kDefaultAppBarTheme,
  );
}
