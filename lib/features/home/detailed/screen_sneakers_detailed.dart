import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/features/home/detailed/widgets/header.dart';
import 'package:sneakers_show/features/home/models/sneakerd.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/app_divider.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/tappable.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class ScreenSneakersDetailed extends StatelessWidget {
  const ScreenSneakersDetailed({
    super.key,
    required this.sneakers,
  });

  final Sneakers sneakers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          DetailedSneakers(
            sneakers: sneakers,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _previes
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: context.color.grey100,
                              ),
                              child: Image.asset(
                                e.image ?? AppAssets.images.sneakers1,
                                width: 70,
                                height: 50,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 10),
                const AppDivider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sneakers.name ?? S.of(context).noData,
                      style: context.text.s16w500,
                    ),
                    Text(
                      sneakers.price ?? S.of(context).noData,
                      style: context.text.s16w500,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).detailedBody,
                  style: context.text.s12w500.copyWith(
                    color: context.color.grey900,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).moreDetails.toUpperCase(),
                  style: context.text.s12w700.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        S.of(context).size,
                        style: context.text.s16w700,
                      ),
                    ),
                    Text(
                      S.of(context).uk,
                      style: context.text.s16w500,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      S.of(context).usa,
                      style: context.text.s16w500.copyWith(
                        color: context.color.grey300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
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
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: context.button.elevated1,
                        child: Text(
                          S.of(context).addToBag.toUpperCase(),
                          style: context.text.h16w700.copyWith(
                            color: context.color.background,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final _sizes = <String>['7.5', '8', '9.5'];

final _previes = <Sneakers>[
  Sneakers(
    image: AppAssets.images.sneakers1,
  ),
  Sneakers(
    image: AppAssets.images.sneakers2,
  ),
  Sneakers(
    image: AppAssets.images.sneakers3,
  ),
  Sneakers(
    image: AppAssets.images.sneakers4,
  ),
];

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 220);
    path.quadraticBezierTo(width / 2.9, height + 30, width, height - 70);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
