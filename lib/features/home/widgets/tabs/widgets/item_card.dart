import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/features/home/models/sneakerd.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.sneakers,
  });

  final Sneakers sneakers;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.color.background,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: context.color.grey100.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: SvgPicture.asset(
              AppAssets.svg.favorite,
            ),
          ),
          Positioned(
            child: RotatedBox(
              quarterTurns: 3,
              child: Container(
                color: context.color.primary,
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 17),
                child: Text(
                  S.of(context).newSection.toUpperCase(),
                  style: context.text.s12w500.copyWith(
                    color: context.color.background,
                    fontSize: 7,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 17),
              Image.asset(
                sneakers.image ?? AppAssets.images.sneakers2,
                width: 100,
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    sneakers.name ?? S.of(context).nikeAirMax,
                    style: context.text.s16w600.copyWith(
                      fontSize: 8,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    sneakers.price ?? '\$170.00',
                    style: context.text.s16w600.copyWith(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
