import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MultiGestureDetector extends StatelessWidget {
  const MultiGestureDetector({
    super.key,
    required this.child,
    this.onMove,
    this.onUp,
    this.onDown,
  });
  final Widget child;
  final Function(PointerMoveEvent)? onMove;
  final Function(PointerUpEvent)? onUp;
  final Function(PointerDownEvent)? onDown;
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      behavior: HitTestBehavior.opaque,
      gestures: {
        MultiGestureRecognizer: GestureRecognizerFactoryWithHandlers<MultiGestureRecognizer>(
          () => MultiGestureRecognizer(onUp: onUp, onMove: onMove, onDown: onDown),
          (instance) {},
        ),
      },
      child: child,
    );
  }
}

class MultiGestureRecognizer extends OneSequenceGestureRecognizer {
  MultiGestureRecognizer({
    this.onMove,
    this.onUp,
    this.onDown,
  });

  final Function(PointerMoveEvent)? onMove;
  final Function(PointerUpEvent)? onUp;
  final Function(PointerDownEvent)? onDown;

  @override
  void addPointer(PointerEvent event) {
    startTrackingPointer(event.pointer);
    // resolve(GestureDisposition.accepted);
  }

  @override
  String get debugDescription => 'singlePointerDrag';

  @override
  void didStopTrackingLastPointer(int pointer) {
    stopTrackingPointer(pointer);
  }

  // double lastY;
  @override
  void handleEvent(PointerEvent event) {
    if (event is PointerDownEvent) {
      onDown?.call(event);
    } else if (event is PointerMoveEvent) {
      onMove?.call(event);
    } else if (event is PointerUpEvent) {
      onUp?.call(event);
      stopTrackingPointer(event.pointer);
    }
  }
}
