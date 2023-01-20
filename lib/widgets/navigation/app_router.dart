import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_show/features/splash/splash_screen.dart';
export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({
    required GlobalKey<NavigatorState> navigatorKey,
  }) {
    rootKey = super.navigatorKey;
  }

  static late final GlobalKey<NavigatorState> rootKey;
}
