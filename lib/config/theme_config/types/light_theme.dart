import 'package:flutter/material.dart';

import '../../../core/constants/theme_constants/global_constants/global_theme_constant.dart';
import '../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../ui_theme/app_bar_theme.dart';
import '../ui_theme/input_decoration_theme.dart';

class LightTheme {
  static final ThemeData kThemeConfig = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.whiteColor,
    textTheme: GlobalThemeConstant.appTextTheme,
    inputDecorationTheme: AppInputDecorationTheme.kInputDecorationTheme,
    appBarTheme: AppsAppBarTheme.kDefaultAppBarTheme,
  );
}
