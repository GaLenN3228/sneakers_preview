import 'package:flutter/material.dart';

class WhitePageRoute extends PageRouteBuilder {
  WhitePageRoute({
    required this.enterPage,
    required this.color,
  }) : super(
            transitionDuration: const Duration(milliseconds: 1700),
            reverseTransitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (context, animation, secondaryAnimation) => enterPage,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return const SizedBox.shrink();
            });

  final Widget enterPage;
  final Color color;

  static PageRouteBuilder scaleTransitionBuilder({required Widget child}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final scale = animation.drive(Tween<double>(begin: 0, end: 1));
          var fadeIn = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
              curve: const Interval(.1, 1),
              parent: animation,
            ),
          );

          return FadeTransition(
            opacity: fadeIn,
            child: ScaleTransition(
              scale: scale,
              child: child,
            ),
          );
        });
  }
}
