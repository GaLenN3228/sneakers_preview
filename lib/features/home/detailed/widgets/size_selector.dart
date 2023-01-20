import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/tappable.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Tappable(
            onTap: () {},
            child: Container(
              width: 70,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: context.color.background,
                boxShadow: [
                  BoxShadow(
                    color: context.color.grey900.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    S.of(context).tryIt,
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    AppAssets.svg.leg,
                    width: 13,
                  )
                ],
              ),
            ),
          ),
          ..._sizes.map(
            (e) => Tappable(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                width: 70,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: context.color.background,
                  boxShadow: [
                    BoxShadow(
                      color: context.color.grey900.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(child: Text(e)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final _sizes = <String>['7.5', '8', '9.5'];
