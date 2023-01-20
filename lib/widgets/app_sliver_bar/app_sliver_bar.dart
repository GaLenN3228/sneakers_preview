import 'package:flutter/material.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

import 'leading_buttons/arrow_leading_button.dart';

class AppSliverBar extends StatelessWidget {
  const AppSliverBar({
    super.key,
    this.title,
    this.titleChild,
    this.canPop = true,
    this.leading,
    this.bottom,
    this.height = kToolbarHeight,
    this.padding = 16.0,
    this.actions,
  });

  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double height;
  final Widget? leading;
  final double padding;
  final String? title;
  final Widget? titleChild;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    Widget? title = titleChild;
    if (title == null) {
      if (this.title == null) {
        title = const SizedBox.shrink();
      } else {
        title = Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            this.title!,
            style: context.text.s24w700,
          ),
        );
      }
    }
    Widget? leading;
    if (canPop) {
      leading = this.leading;
      leading ??= const ArrowLeadingButton();
    }

    return SliverAppBar(
      centerTitle: false,
      titleSpacing: 0.0,
      collapsedHeight: height,
      toolbarHeight: height,
      pinned: true,
      backgroundColor: context.color.background,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: leading,
      title: title,
      bottom: bottom,
      actions: actions,
    );
  }
}
