import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../feat/home/view/screen/home_screen.dart';
import '../../feat/misc/error/view/screen/error_screen.dart';
import '../../feat/misc/exception/view/screen/exception_screen.dart';
import '../../feat/misc/splash/view/screen/splash_screen.dart';
import 'additionals/route_transitions.dart';
import 'route_names.dart';

class RouteHandler {
  static final router = GoRouter(
    ///initial route and it will be the entry point for navigator api
    initialLocation: RouteNames.splashScreen,

    /// To enable log output, enable the debugLogDiagnostics parameter:
    debugLogDiagnostics: true,

    /// error page builder
    errorPageBuilder: (context, state) => CustomSlideTransition(
      child: ErrorScreen(),
    ),

    // onException: (_, GoRouterState state, GoRouter router) {
    //   router.go(RouteNames.exceptionScreen, extra: state.uri.toString());
    // },

    /// navigator observe actions
    observers: [
      NavigatorObserver(),
    ],

    /// all the routes comes under these will acts as sub routes
    /// and children routes for the initial route
    routes: <RouteBase>[
      /// splash screen
      GoRoute(
        path: RouteNames.splashScreen,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: SplashScreen(),
        ),
        routes: <RouteBase>[
          /// home screen
          GoRoute(
            path: RouteNames.homeScreen,
            pageBuilder: (context, state) => CustomSlideTransition(
              child: HomeScreen(),
            ),
          ),

          /// exception screen
          GoRoute(
            path: RouteNames.exceptionScreen,
            builder: (BuildContext context, GoRouterState state) {
              return ExceptionScreen();
            },
          ),
        ],
      ),
    ],
  );
}
