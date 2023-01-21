import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_show/features/cart/bloc/bloc.dart';
import 'package:sneakers_show/features/cart/models/cart_item.dart';
import 'package:sneakers_show/features/home/detailed/widgets/header.dart';
import 'package:sneakers_show/features/home/detailed/widgets/size_selector.dart';
import 'package:sneakers_show/features/home/models/sneakerd.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/app_divider.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
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
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
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
                const SizeSelector(),
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
                        onPressed: () {
                          BlocProvider.of<CartBloc>(context).add(
                            AddToCardEvent(
                              item: CartItem(
                                id: sneakers.id,
                                name: sneakers.name,
                                price: sneakers.price,
                                image: sneakers.image,
                                count: 1,
                              ),
                            ),
                          );
                        },
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

final _previes = <Sneakers>[
  Sneakers(
    id: 1,
    image: AppAssets.images.sneakers1,
  ),
  Sneakers(
    id: 2,
    image: AppAssets.images.sneakers2,
  ),
  Sneakers(
    id: 3,
    image: AppAssets.images.sneakers3,
  ),
  Sneakers(
    id: 4,
    image: AppAssets.images.sneakers4,
  ),
];
