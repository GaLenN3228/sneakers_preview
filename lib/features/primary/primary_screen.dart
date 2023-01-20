import 'package:flutter/material.dart';
import 'package:sneakers_show/widgets/navigation/app_router.dart';
import 'package:sneakers_show/widgets/navigation/navigation_bar/navbar.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      builder: (context, child, animation) => child,
      routes: const [
        HomeRouter(
          children: [HomeScreenRoute()],
        ),
        FavoritesRouter(
          children: [FavoritesScreenRoute()],
        ),
        PickUpRouter(
          children: [PickUpScreenRoute()],
        ),
        CartRouter(
          children: [CartScreenRoute()],
        ),
        CabinetRouter(
          children: [CabinetScreenRoute()],
        ),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavBar(
          current: tabsRouter.activeIndex,
          switchTo: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
