import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/app_constants/ui_constants/asset_paths.dart';
import '../../../../../core/constants/app_constants/ui_constants/text_values.dart';
import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../core/shared/shared_widgets/basic_widgets/text_widget.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// adaptive ui properties
    final screenSize = MediaQuery.of(context).size;
    final TextTheme txtTheme = Theme.of(context).textTheme;
    final BoxConstraints defaultConstraints = BoxConstraints(
      maxHeight: screenSize.height * 0.25,
      maxWidth: screenSize.width * 0.8,
    );

    return Scaffold(
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            /// lottie file widget
            ConstrainedBox(
              constraints: defaultConstraints,
              child: Lottie.asset(
                AppAssetPaths.kErrorLottiePath,
                repeat: true,
                fit: BoxFit.cover,
              ),
            ),

            /// splash title widget
            ConstrainedBox(
              constraints: defaultConstraints,
              child: TextWidget(
                txtVal: AppTexts.kAppTitle,
                textStyle: txtTheme.titleLarge?.copyWith(
                  color: AppColors.errorColor,
                ),
              ),
            ),

            /// extra space for safety & center alignment
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
