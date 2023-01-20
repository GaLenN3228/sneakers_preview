import 'package:flutter/material.dart';

class NavigatorTransitions {
  static Widget fade(
    BuildContext context,
    Animation<double> animation,
    Animation<double> reverseAnimation,
    Widget child,
  ) {
    var tween = Tween(
      begin: 0.0,
      end: 1.0,
    ).chain(
      CurveTween(curve: Curves.ease),
    );

    return FadeTransition(
      opacity: animation.drive(tween),
      child: child,
    );
  }
}
