import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/features/home/detailed/widgets/shaper.dart';
import 'package:sneakers_show/features/home/models/sneakerd.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/navigation/app_router.dart';
import 'package:sneakers_show/widgets/tappable.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class DetailedSneakers extends StatelessWidget {
  const DetailedSneakers({
    super.key,
    required this.sneakers,
  });

  final Sneakers sneakers;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomShape(),
          child: Container(
            height: 400,
            color: sneakers.color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            sneakers.image ?? AppAssets.images.sneakers1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Tappable(
                onTap: () {
                  context.router.pop();
                },
                child: SvgPicture.asset(
                  AppAssets.svg.arrowBack,
                  color: context.color.background,
                ),
              ),
              Text(
                sneakers.brand ?? S.of(context).noData,
                style: context.text.s16w500.copyWith(
                  color: context.color.background,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Tappable(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: sneakers.color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 6,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    AppAssets.svg.favorite,
                    width: 20,
                    height: 20,
                    color: context.color.background,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
