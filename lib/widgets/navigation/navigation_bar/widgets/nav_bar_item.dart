part of '../navbar.dart';

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.isActive,
    required this.activeIconPath,
    required this.inactiveIconPath,
  });
  final bool isActive;

  final String activeIconPath;
  final String inactiveIconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SvgPicture.asset(
            isActive ? activeIconPath : inactiveIconPath,
            width: 24,
            height: 24,
            color: isActive ? context.color.primary : context.color.grey700,
          ),
        ),
      ],
    );
  }
}
