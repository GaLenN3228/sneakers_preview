import 'package:flutter/widgets.dart';

class Tappable extends StatefulWidget {
  const Tappable({
    Key? key,
    required this.child,
    this.pressedOpacity,
    this.onLongPressed,
    this.onTap,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final double? pressedOpacity;
  final VoidCallback? onTap;
  final VoidCallback? onLongPressed;
  final EdgeInsets? padding;

  @override
  State<Tappable> createState() => _TappableState();
}

class _TappableState extends State<Tappable> with SingleTickerProviderStateMixin {
  // Eyeballed values. Feel free to tweak.
  static const Duration kFadeOutDuration = Duration(milliseconds: 10);
  static const Duration kFadeInDuration = Duration(milliseconds: 100);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController? _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController!.drive(CurveTween(curve: Curves.decelerate)).drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(Tappable old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = widget.pressedOpacity ?? 0.4;
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _animationController = null;
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController?.isAnimating ?? false) return;
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController!.animateTo(1.0, duration: kFadeOutDuration)
        : _animationController!.animateTo(0.0, duration: kFadeInDuration);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.onTap != null;
    final padding = widget.padding ?? EdgeInsets.zero;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: enabled ? _handleTapDown : null,
      onTapUp: enabled ? _handleTapUp : null,
      onTapCancel: enabled ? _handleTapCancel : null,
      onLongPress: widget.onLongPressed,
      onTap: widget.onTap,
      child: Semantics(
        button: true,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Padding(
            padding: padding,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
