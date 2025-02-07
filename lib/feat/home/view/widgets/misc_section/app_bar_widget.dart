import 'package:flutter/material.dart';

import '../../../../../core/shared/shared_widgets/basic_widgets/app_bar_widget.dart';

AppBar buildAppBarWidget(
  BoxConstraints appBarDefConstraints,
  TextTheme txtTheme,
  String appBarTitle,
) {
  return commonAppBarWidget(
    appBarDefConstraints: appBarDefConstraints,
    txtTheme: txtTheme,
    appBarTitle: appBarTitle,
  );
}
