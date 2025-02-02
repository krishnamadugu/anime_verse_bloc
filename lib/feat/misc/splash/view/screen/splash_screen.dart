import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/route_config/route_names.dart';
import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../widgets/splash_body_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// adaptive ui properties
    final screenSize = MediaQuery.of(context).size;
    final TextTheme txtTheme = Theme.of(context).textTheme;
    final BoxConstraints defaultConstraints = BoxConstraints(
      maxHeight: screenSize.height * 0.25,
      maxWidth: screenSize.width * 0.8,
    );

    /// flutter splash screen plugin widget
    return FlutterSplashScreen(
      useImmersiveMode: true,
      backgroundColor: AppColors.whiteColor,
      duration: Duration(seconds: 3),
      onEnd: () {
        context.go(RouteNames.homeScreen);
      },
      splashScreenBody: SizedBox(
        height: screenSize.height,
        width: screenSize.width,

        /// custom splash body widget
        child: SplashBodyWidget(
          defaultConstraints: defaultConstraints,
          txtTheme: txtTheme,
        ),
      ),
    );
  }
}
