import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/features/home/models/sneakerd.dart';
import 'package:sneakers_show/features/home/widgets/tabs/widgets/item_card.dart';
import 'package:sneakers_show/features/home/widgets/tabs/widgets/slider.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class NikeTab extends StatelessWidget {
  const NikeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: Row(
                children: [
                  Text(
                    S.of(context).newSection,
                    style: context.text.s16w500,
                  ),
                  const SizedBox(width: 38),
                  Text(
                    S.of(context).featured,
                    style: context.text.s16w500,
                  ),
                  const SizedBox(width: 38),
                  Text(
                    S.of(context).upcoming,
                    style: context.text.s16w500,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            const Expanded(
              child: SneakersSlider(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).more,
                style: context.text.s16w600,
              ),
              SvgPicture.asset(
                AppAssets.svg.arrowRight,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: sneakers
                .map((item) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ItemCard(
                        sneakers: item,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

final sneakers = <Sneakers>[
  Sneakers(
    id: 1,
    name: S.current.nikeAirMax,
    price: '\$170.00',
    image: AppAssets.images.sneakers2,
    brand: S.current.nike,
    color: Colors.pink,
  ),
  Sneakers(
    id: 2,
    name: S.current.nikeAirMax,
    price: '\$130.00',
    image: AppAssets.images.sneakers1,
    brand: S.current.nike,
    color: Colors.blue,
  ),
  Sneakers(
    id: 3,
    name: S.current.nikeAirMax,
    price: '\$170.00',
    image: AppAssets.images.sneakers3,
    brand: S.current.nike,
    color: Colors.pink,
  ),
  Sneakers(
    id: 4,
    name: S.current.nikeAirMax,
    price: '\$130.00',
    image: AppAssets.images.sneakers4,
    brand: S.current.nike,
    color: Colors.blue,
  ),
];
