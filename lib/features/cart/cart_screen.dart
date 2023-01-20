import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sneakers_show/features/cart/bloc/bloc.dart';
import 'package:sneakers_show/features/cart/widgets/cart_list.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/constants/app_assets.dart';
import 'package:sneakers_show/widgets/tappable.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> totalCount = [];
  int sum = 0;

  @override
  void initState() {
    BlocProvider.of<CartBloc>(context).add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartDataState) {
          totalCount.clear();
          sum = 0;
          for (final count in state.data) {
            totalCount.add(count.count!);
          }
          sum = totalCount.sum;
        }
      },
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartDataState) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: context.color.background,
              title: Text(
                S.of(context).myBag,
                style: context.text.s24w700,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Text(
                      S.of(context).totalItems(sum),
                      style: context.text.s14w500,
                    ),
                  ),
                ),
              ],
            ),
            body: state.data.isNotEmpty
                ? CartList(
                    items: state.data,
                  )
                : Center(
                    child: Text(
                      S.of(context).cartEmpty,
                      style: context.text.s16w500,
                    ),
                  ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
