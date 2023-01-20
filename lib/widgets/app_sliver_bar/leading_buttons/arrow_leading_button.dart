import 'package:sneakers_show/widgets/constants/app_assets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakers_show/widgets/navigation/app_router.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class ArrowLeadingButton extends StatelessWidget {
  const ArrowLeadingButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(AppAssets.svg.arrowBack),
      color: context.color.dark,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        FocusScope.of(context).unfocus();
        onPressed?.call();
        if (onPressed == null) {
          context.router.pop();
        }
      },
    );
  }
}
