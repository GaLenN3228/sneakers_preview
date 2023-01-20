import 'package:flutter/material.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.of(context).cart),
      ),
    );
  }
}
