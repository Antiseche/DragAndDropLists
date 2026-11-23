import 'package:flutter/widgets.dart';

/// An [AnimatedSize] that can be turned off with a zero duration.
///
/// [AnimatedSize] with [Duration.zero] relayouts itself during its own layout
/// ("A RenderAnimatedSize was mutated in its own performLayout implementation"),
/// so with a zero duration the child is shown directly, at its new size.
class SizeAnimation extends StatelessWidget {
  final Duration duration;
  final AlignmentGeometry alignment;
  final Widget child;

  const SizeAnimation({
    super.key,
    required this.duration,
    this.alignment = Alignment.center,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (duration == Duration.zero) return child;
    return AnimatedSize(duration: duration, alignment: alignment, child: child);
  }
}
