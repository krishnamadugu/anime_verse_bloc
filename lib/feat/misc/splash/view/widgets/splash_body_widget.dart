import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/app_constants/ui_constants/asset_paths.dart';
import '../../../../../core/constants/app_constants/ui_constants/text_values.dart';
import '../../../../../core/shared/shared_widgets/basic_widgets/text_widget.dart';

class SplashBodyWidget extends StatelessWidget {
  const SplashBodyWidget({
    super.key,
    required this.defaultConstraints,
    required this.txtTheme,
  });

  final BoxConstraints defaultConstraints;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        /// lottie file widget
        ConstrainedBox(
          constraints: defaultConstraints,
          child: Lottie.asset(
            AppAssetPaths.kSplashLottiePath,
            repeat: true,
            fit: BoxFit.cover,
          ),
        ),

        /// splash title widget
        ConstrainedBox(
          constraints: defaultConstraints,
          child: TextWidget(
            txtVal: AppTexts.kAppTitle,
            textStyle: txtTheme.displaySmall,
          ),
        ),

        /// extra space for safety & center alignment
        const SizedBox(height: 10.0),
      ],
    );
  }
}
