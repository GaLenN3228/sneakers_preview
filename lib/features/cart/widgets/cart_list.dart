import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/features/cart/bloc/bloc.dart';
import 'package:sneakers_show/features/cart/models/cart_item.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/tappable.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class CartList extends StatelessWidget {
  const CartList({
    super.key,
    required this.items,
  });

  final List<CartItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, i) {
        return Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: context.color.grey300,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                const SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(items[i].name ?? S.of(context).noData),
                    const SizedBox(height: 7),
                    Text(items[i].price ?? S.of(context).noData),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        Tappable(
                          onTap: () {
                            if (items[i].count == 1) {
                              BlocProvider.of<CartBloc>(context).add(
                                RemoveFromCart(
                                  item: items[i],
                                ),
                              );
                            } else {
                              BlocProvider.of<CartBloc>(context).add(
                                DecrementCartItem(
                                  item: items[i],
                                ),
                              );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: context.color.grey300,
                            ),
                            child: SvgPicture.asset(
                              AppAssets.svg.minus,
                              width: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text('${items[i].count ?? S.of(context).noData}'),
                        const SizedBox(width: 10),
                        Tappable(
                          onTap: () {
                            BlocProvider.of<CartBloc>(context).add(
                              IncrementCarItem(
                                item: items[i],
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: context.color.grey300,
                            ),
                            child: SvgPicture.asset(
                              AppAssets.svg.plus,
                              width: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 15,
              child: Image.asset(
                items[i].image ?? AppAssets.images.sneakers1,
                width: 90,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, i) => const SizedBox(height: 20),
    );
  }
}
