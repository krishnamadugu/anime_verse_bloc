import 'package:flutter/material.dart';

import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../core/shared/shared_widgets/basic_widgets/text_widget.dart';

class GenreItemWidget extends StatelessWidget {
  const GenreItemWidget({
    super.key,
    required this.txtTheme,
    required this.txtVal,
  });

  final TextTheme txtTheme;
  final String txtVal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.pearlColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      alignment: Alignment.center,
      child: TextWidget(
        txtVal: txtVal,
        textStyle: txtTheme.bodyMedium,
      ),
    );
  }
}
