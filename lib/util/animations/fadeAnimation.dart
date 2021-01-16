import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final double beginOpacity;
  final double endOpacity;
  final double beginY;
  final double endY;

  FadeAnimation(this.delay, this.child,
      {this.beginOpacity = 0.0,
      this.endOpacity = 1.0,
      this.beginY = -130.0,
      this.endY = 0.0});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500),
          Tween(begin: this.beginOpacity, end: this.endOpacity)),
      Track("translateY").add(Duration(milliseconds: 500),
          Tween(begin: this.beginY, end: this.endY),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
