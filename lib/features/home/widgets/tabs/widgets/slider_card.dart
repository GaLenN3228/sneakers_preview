import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/features/home/models/sneakerd.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/tappable.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class SliderCard extends StatelessWidget {
  const SliderCard(
    this.offsetRatio, {
    super.key,
    required this.sneakers,
    required this.cardWidth,
    required this.cardHeight,
    required this.shadowsIsOn,
    required this.axis,
  })  : maxOffsetVertical = cardWidth * 0.06,
        maxOffsetHorizontal = cardHeight * 0.06;

  final Sneakers sneakers;
  final Axis axis;
  final double cardHeight;
  final double cardWidth;
  final double maxOffsetHorizontal;
  final double maxOffsetVertical;
  final double offsetRatio;
  final bool shadowsIsOn;

  @override
  Widget build(BuildContext context) {
    double leftMargin = maxOffsetHorizontal + 10.0;
    double rightMargin = maxOffsetHorizontal + 10.0;
    double userTileVerticalMargin = maxOffsetVertical;
    double offset = offsetRatio * maxOffsetHorizontal;
    leftMargin = (maxOffsetHorizontal + offset) + 10.0;
    rightMargin = (maxOffsetHorizontal - offset) + 10.0;
    return Stack(
      children: [
        Hero(
          tag: sneakers.id,
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              color: sneakers.color ?? context.color.primary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sneakers.brand?.toUpperCase() ?? S.of(context).noData,
                      style: context.text.b16w600.copyWith(
                        color: context.color.background,
                      ),
                    ),
                    SvgPicture.asset(
                      AppAssets.svg.favorite,
                      width: 24,
                      color: context.color.background,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  sneakers.name ?? S.of(context).nikeAirMax,
                  style: context.text.s20w700.copyWith(
                    color: context.color.background,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  sneakers.price ?? S.of(context).noData,
                  style: context.text.b16w600.copyWith(
                    color: context.color.background,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Tappable(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset(
                      AppAssets.svg.arrowRight,
                      color: context.color.background,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(leftMargin, 0.0, rightMargin, userTileVerticalMargin),
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              sneakers.image ?? AppAssets.images.sneakers1,
            ),
          ),
        ),
      ],
    );
  }
}
