import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/features/home/widgets/tabs/nike_tab.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/navigation/app_router.dart';
import 'package:sneakers_show/widgets/tappable.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class SneakersSlider extends StatefulWidget {
  const SneakersSlider({super.key});

  @override
  State<SneakersSlider> createState() => _SneakersSliderState();
}

class _SneakersSliderState extends State<SneakersSlider> {
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: PageView.builder(
        controller: controller,
        itemCount: sneakers.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              context.router.push(
                ScreenSneakersDetailedRoute(
                  sneakers: sneakers[i],
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(right: 30),
                  decoration: BoxDecoration(
                    color: sneakers[i].color ?? context.color.primary,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            sneakers[i].brand?.toUpperCase() ?? S.of(context).noData,
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
                        sneakers[i].name ?? S.of(context).nikeAirMax,
                        style: context.text.s20w700.copyWith(
                          color: context.color.background,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        sneakers[i].price ?? S.of(context).noData,
                        style: context.text.b16w600.copyWith(
                          color: context.color.background,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Tappable(
                        onTap: () {
                          controller.nextPage(
                            duration: const Duration(
                              microseconds: 600,
                            ),
                            curve: Curves.bounceIn,
                          );
                        },
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
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    sneakers[i].image ?? AppAssets.images.sneakers1,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
