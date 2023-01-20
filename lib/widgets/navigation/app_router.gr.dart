// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    ScreenSneakersDetailedRoute.name: (routeData) {
      final args = routeData.argsAs<ScreenSneakersDetailedRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: ScreenSneakersDetailed(
          key: args.key,
          sneakers: args.sneakers,
        ),
      );
    },
    PrimaryScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PrimaryScreen(),
        transitionsBuilder: NavigatorTransitions.fade,
        durationInMilliseconds: 500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    FavoritesRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    PickUpRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    CartRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    CabinetRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    FavoritesScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const FavoritesScreen(),
      );
    },
    PickUpScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const PickUpScreen(),
      );
    },
    CartScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    CabinetScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const CabinetScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          ScreenSneakersDetailedRoute.name,
          path: '/screen-sneakers-detailed',
        ),
        RouteConfig(
          PrimaryScreenRoute.name,
          path: '/',
          children: [
            RouteConfig(
              HomeRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeRouter.name,
                )
              ],
            ),
            RouteConfig(
              FavoritesRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  FavoritesScreenRoute.name,
                  path: '',
                  parent: FavoritesRouter.name,
                )
              ],
            ),
            RouteConfig(
              PickUpRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  PickUpScreenRoute.name,
                  path: '',
                  parent: PickUpRouter.name,
                )
              ],
            ),
            RouteConfig(
              CartRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  CartScreenRoute.name,
                  path: '',
                  parent: CartRouter.name,
                )
              ],
            ),
            RouteConfig(
              CabinetRouter.name,
              path: 'empty-router-page',
              parent: PrimaryScreenRoute.name,
              children: [
                RouteConfig(
                  CabinetScreenRoute.name,
                  path: '',
                  parent: CabinetRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [ScreenSneakersDetailed]
class ScreenSneakersDetailedRoute extends PageRouteInfo<ScreenSneakersDetailedRouteArgs> {
  ScreenSneakersDetailedRoute({
    Key? key,
    required Sneakers sneakers,
  }) : super(
          ScreenSneakersDetailedRoute.name,
          path: '/screen-sneakers-detailed',
          args: ScreenSneakersDetailedRouteArgs(
            key: key,
            sneakers: sneakers,
          ),
        );

  static const String name = 'ScreenSneakersDetailedRoute';
}

class ScreenSneakersDetailedRouteArgs {
  const ScreenSneakersDetailedRouteArgs({
    this.key,
    required this.sneakers,
  });

  final Key? key;

  final Sneakers sneakers;

  @override
  String toString() {
    return 'ScreenSneakersDetailedRouteArgs{key: $key, sneakers: $sneakers}';
  }
}

/// generated route for
/// [PrimaryScreen]
class PrimaryScreenRoute extends PageRouteInfo<void> {
  const PrimaryScreenRoute({List<PageRouteInfo>? children})
      : super(
          PrimaryScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'PrimaryScreenRoute';
}

/// generated route for
/// [EmptyRouterPage]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter({List<PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [EmptyRouterPage]
class FavoritesRouter extends PageRouteInfo<void> {
  const FavoritesRouter({List<PageRouteInfo>? children})
      : super(
          FavoritesRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'FavoritesRouter';
}

/// generated route for
/// [EmptyRouterPage]
class PickUpRouter extends PageRouteInfo<void> {
  const PickUpRouter({List<PageRouteInfo>? children})
      : super(
          PickUpRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'PickUpRouter';
}

/// generated route for
/// [EmptyRouterPage]
class CartRouter extends PageRouteInfo<void> {
  const CartRouter({List<PageRouteInfo>? children})
      : super(
          CartRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'CartRouter';
}

/// generated route for
/// [EmptyRouterPage]
class CabinetRouter extends PageRouteInfo<void> {
  const CabinetRouter({List<PageRouteInfo>? children})
      : super(
          CabinetRouter.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'CabinetRouter';
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [FavoritesScreen]
class FavoritesScreenRoute extends PageRouteInfo<void> {
  const FavoritesScreenRoute()
      : super(
          FavoritesScreenRoute.name,
          path: '',
        );

  static const String name = 'FavoritesScreenRoute';
}

/// generated route for
/// [PickUpScreen]
class PickUpScreenRoute extends PageRouteInfo<void> {
  const PickUpScreenRoute()
      : super(
          PickUpScreenRoute.name,
          path: '',
        );

  static const String name = 'PickUpScreenRoute';
}

/// generated route for
/// [CartScreen]
class CartScreenRoute extends PageRouteInfo<void> {
  const CartScreenRoute()
      : super(
          CartScreenRoute.name,
          path: '',
        );

  static const String name = 'CartScreenRoute';
}

/// generated route for
/// [CabinetScreen]
class CabinetScreenRoute extends PageRouteInfo<void> {
  const CabinetScreenRoute()
      : super(
          CabinetScreenRoute.name,
          path: '',
        );

  static const String name = 'CabinetScreenRoute';
}
