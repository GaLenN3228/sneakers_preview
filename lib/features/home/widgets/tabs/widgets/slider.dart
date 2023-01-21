import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_show/features/home/detailed/screen_sneakers_detailed.dart';
import 'package:sneakers_show/features/home/widgets/tabs/nike_tab.dart';
import 'package:sneakers_show/features/home/widgets/tabs/widgets/slider_card.dart';
import 'package:sneakers_show/widgets/navigation/app_router.dart';
import 'package:sneakers_show/widgets/navigation_transition.dart';
import 'package:sneakers_show/widgets/tappable_edge.dart';
import 'package:sneakers_show/widgets/theme/interfaces/app_theme.dart';

class SneakersSlider extends StatefulWidget {
  const SneakersSlider({super.key});

  @override
  State<SneakersSlider> createState() => _SneakersSliderState();
}

class _SneakersSliderState extends State<SneakersSlider> with SingleTickerProviderStateMixin {
  final controller = PageController(viewportFraction: 0.8);
  bool _isScrolling = false;
  Axis scrollDirection = Axis.horizontal;
  ScrollController listContoller = ScrollController();
  double _normalizedOffset = 0;
  double _prevScrollX = 0;

  AnimationController? _tweenController;
  Tween<double>? _tween;
  Animation<double>? _tweenAnim;
  late double currentPageValue;
  late int focusedPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Listener(
        onPointerUp: _handlePointerUp,
        child: NotificationListener(
          onNotification: _handleScrollNotifications,
          child: PageView.builder(
            controller: controller,
            itemCount: sneakers.length,
            dragStartBehavior: DragStartBehavior.down,
            itemBuilder: (context, i) {
              return ElasticDragAlt(
                axis: Axis.horizontal,
                distance: 30.0,
                offset: _normalizedOffset,
                width: 275,
                height: 467,
                child: Container(
                  alignment: Alignment.center,
                  child: Rotation3d(
                    rotationIsOn: true,
                    rotationX: 0,
                    rotationY: -_normalizedOffset * 15.0,
                    child: TappableEdges(
                      width: 275,
                      height: 467,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 275 * 0.01,
                        vertical: 467 * 0.005,
                      ),
                      child: SliderCard(
                        _normalizedOffset,
                        sneakers: sneakers[i],
                        axis: scrollDirection,
                        shadowsIsOn: false,
                        cardWidth: 275 - (275 * 0.01),
                        cardHeight: 467 - (467 * 0.05),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          WhitePageRoute.scaleTransitionBuilder(
                            child: ScreenSneakersDetailed(
                              sneakers: sneakers[i],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  bool _handleScrollNotifications(Notification notification) {
    if (notification is ScrollUpdateNotification) {
      if (_isScrolling) {
        double dx = notification.metrics.pixels - _prevScrollX;
        double scrollFactor = .01;
        double newOffset = (_normalizedOffset + dx * scrollFactor);
        _setOffset(newOffset.clamp(-1.0, 1.0));
      }
      _prevScrollX = notification.metrics.pixels;
    } else if (notification is ScrollStartNotification) {
      _isScrolling = true;
      _prevScrollX = notification.metrics.pixels;
      _tweenController?.stop();
    } else if (notification is ScrollEndNotification) {
      focusedPage = controller.page!.round();
    }
    return true;
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_isScrolling) {
      _isScrolling = false;
      _startOffsetTweenToZero();
    }
  }

  void _setOffset(double value) {
    setState(() {
      _normalizedOffset = value;
    });
  }

  void _startOffsetTweenToZero() {
    int tweenTime = 1000;
    if (_tweenController == null) {
      _tweenController = AnimationController(vsync: this, duration: Duration(milliseconds: tweenTime));
      _tween = Tween<double>(begin: -1, end: 0);
      _tweenAnim = _tween?.animate(CurvedAnimation(parent: _tweenController!, curve: Curves.elasticOut))
        ?..addListener(() {
          _setOffset(_tweenAnim!.value);
        });
    }
    _tween!.begin = _normalizedOffset;
    _tweenController?.reset();
    _tween!.end = 0;
    _tweenController!.forward();
  }

  @override
  void dispose() {
    _tweenController?.dispose();
    super.dispose();
  }
}

class Rotation3d extends StatelessWidget {
  const Rotation3d({
    super.key,
    required this.child,
    this.rotationX = 0,
    this.rotationY = 0,
    this.rotationZ = 0,
    this.rotationIsOn = true,
  });

  static const double degrees2Radians = pi / 180;

  final Widget child;
  final bool rotationIsOn;
  final double rotationX;
  final double rotationY;
  final double rotationZ;

  @override
  Widget build(BuildContext context) {
    Matrix4 transform = Matrix4.identity()..setEntry(3, 2, 0.001);
    if (rotationIsOn) {
      transform
        ..rotateX(rotationX * degrees2Radians)
        ..rotateY(rotationY * degrees2Radians)
        ..rotateZ(rotationZ * degrees2Radians);
    }
    return Transform(alignment: FractionalOffset.center, transform: transform, child: child);
  }
}

class ElasticDragAlt extends StatelessWidget {
  const ElasticDragAlt({
    super.key,
    required this.offset,
    required this.child,
    this.isOn = true,
    required this.distance,
    this.axis = Axis.vertical,
    required this.width,
    required this.height,
  });

  final double offset;
  final bool isOn;
  final double distance;
  final Axis axis;
  final double width;
  final double height;

  final Widget child;
  @override
  Widget build(BuildContext context) {
    double left = 0;
    double right = 0;
    if (isOn) {
      switch (axis) {
        case Axis.vertical:
        case Axis.horizontal:
          {
            var output = offset.abs() * distance;
            if (offset.isNegative) {
              left = output;
              right = -output;
            } else {
              left = -output;
              right = output;
            }
            break;
          }
      }
    }
    // print('---------- offset : $offset');
    // print('---------- top : $top');
    // print('---------- left : $left');
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: left,
            right: right,
            bottom: 0,
            child: SizedBox(
              width: width,
              height: height,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
