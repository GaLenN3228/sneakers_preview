import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

part 'widgets/nav_bar_item.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.current,
    required this.switchTo,
  });

  final void Function(int) switchTo;
  final int current;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: context.color.background,
      enableFeedback: true,
      currentIndex: current,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 4,
      selectedItemColor: context.color.primary,
      unselectedItemColor: context.color.grey900,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: _NavBarItem(
            isActive: current == 0,
            activeIconPath: AppAssets.svg.home,
            inactiveIconPath: AppAssets.svg.home,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: _NavBarItem(
            isActive: current == 1,
            activeIconPath: AppAssets.svg.favorite,
            inactiveIconPath: AppAssets.svg.favorite,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: _NavBarItem(
            isActive: current == 2,
            activeIconPath: AppAssets.svg.address,
            inactiveIconPath: AppAssets.svg.address,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: _NavBarItem(
            isActive: current == 3,
            activeIconPath: AppAssets.svg.cart,
            inactiveIconPath: AppAssets.svg.cart,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: _NavBarItem(
            isActive: current == 4,
            activeIconPath: AppAssets.svg.cabinet,
            inactiveIconPath: AppAssets.svg.cabinet,
          ),
        ),
      ],
      onTap: (index) async {
        switchTo(index);
      },
    );
  }
}
