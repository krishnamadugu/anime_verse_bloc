import 'package:flutter/material.dart';

import '../../../../../core/constants/app_constants/ui_constants/text_values.dart';
import '../../../../../core/shared/shared_widgets/basic_widgets/text_widget.dart';

AppBar buildAppBarWidget(
  BoxConstraints appBarDefConstraints,
  TextTheme txtTheme,
) {
  return AppBar(
    automaticallyImplyLeading: false,
    surfaceTintColor: Colors.transparent,
    elevation: 20.0,

    /// title widget
    title: ConstrainedBox(
      constraints: appBarDefConstraints,
      child: TextWidget(
        txtVal: AppTexts.kHomeAppBarTitle,
        textStyle: txtTheme.titleMedium?.copyWith(
          wordSpacing: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
