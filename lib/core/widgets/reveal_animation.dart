import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class RevealAnimation extends StatefulWidget {
  final Widget child;
  final bool isLeft;
  final Duration delay;

  const RevealAnimation({
    super.key,
    required this.child,
    this.isLeft = false,
    this.delay = Duration.zero,
  });

  @override
  State<RevealAnimation> createState() => _RevealAnimationState();
}

class _RevealAnimationState extends State<RevealAnimation> with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  bool _hasFired = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.hashCode.toString()),
      onVisibilityChanged: (info) {
        if (!_hasFired && info.visibleFraction > 0.08) {
          _hasFired = true;
          Future.delayed(widget.delay, () {
            if (mounted) {
              setState(() => _isVisible = true);
            }
          });
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOut,
        opacity: _isVisible ? 1.0 : 0.0,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOut,
          offset: _isVisible 
            ? Offset.zero 
            : (widget.isLeft ? const Offset(-0.2, 0) : const Offset(0, 0.2)),
          child: widget.child,
        ),
      ),
    );
  }
}
