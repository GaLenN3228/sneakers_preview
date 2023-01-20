import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_show/features/cabinet/cabinet_screen.dart';
import 'package:sneakers_show/features/cart/cart_screen.dart';
import 'package:sneakers_show/features/favorites/favorites_screen.dart';
import 'package:sneakers_show/features/home/detailed/screen_sneakers_detailed.dart';
import 'package:sneakers_show/features/home/home_screen.dart';
import 'package:sneakers_show/features/home/models/sneakerd.dart';
import 'package:sneakers_show/features/pick_up/pick_screen.dart';
import 'package:sneakers_show/features/primary/primary_screen.dart';
import 'package:sneakers_show/features/splash/splash_screen.dart';
import 'package:sneakers_show/widgets/navigation/navigator_transitions.dart';
export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: ScreenSneakersDetailed),
    CustomRoute(
      page: PrimaryScreen,
      initial: true,
      transitionsBuilder: NavigatorTransitions.fade,
      durationInMilliseconds: 500,
      children: [
        AutoRoute(
          page: EmptyRouterPage,
          name: 'HomeRouter',
          children: [
            AutoRoute(page: HomeScreen, initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'FavoritesRouter',
          children: [
            AutoRoute(page: FavoritesScreen, initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'PickUpRouter',
          children: [
            AutoRoute(page: PickUpScreen, initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'CartRouter',
          children: [
            AutoRoute(page: CartScreen, initial: true),
          ],
        ),
        AutoRoute(
          page: EmptyRouterPage,
          name: 'CabinetRouter',
          children: [
            AutoRoute(page: CabinetScreen, initial: true),
          ],
        ),
      ],
    ),
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
