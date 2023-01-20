import 'package:flutter/material.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.padding,
  });

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      width: double.infinity,
      height: 1,
      color: context.color.grey700,
    );
  }
}
