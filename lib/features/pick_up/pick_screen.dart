import 'package:flutter/material.dart';
import 'package:sneakers_show/localization/generated/l10n.dart';

class PickUpScreen extends StatelessWidget {
  const PickUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.of(context).homeWithPin),
      ),
    );
  }
}
