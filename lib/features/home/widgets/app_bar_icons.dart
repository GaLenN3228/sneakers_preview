import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/tappable.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Tappable(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.color.grey100,
            ),
            child: SvgPicture.asset(
              AppAssets.svg.search,
              width: 20,
              height: 20,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Tappable(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.color.grey100,
            ),
            child: SvgPicture.asset(
              AppAssets.svg.bell,
              width: 20,
              height: 20,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
