import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_show/features/cart/bloc/bloc.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
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
                      S.of(context).totalItems(state.data.length),
                      style: context.text.s14w500,
                    ),
                  ),
                ),
              ],
            ),
            body: state.data.isNotEmpty
                ? ListView.separated(
                    itemCount: state.data.length,
                    itemBuilder: (context, i) {
                      return Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.data[i].name ?? S.of(context).noData),
                              Text(state.data[i].price ?? S.of(context).noData),
                              Row(
                                children: [
                                  Text('${state.data[i].count ?? S.of(context).noData}'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, i) => const SizedBox(height: 20),
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
