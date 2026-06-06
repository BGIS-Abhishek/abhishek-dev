import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomCursor extends StatefulWidget {
  final Widget child;
  const CustomCursor({super.key, required this.child});

  @override
  State<CustomCursor> createState() => _CustomCursorState();
}

class _CustomCursorState extends State<CustomCursor> {
  Offset _mousePosition = Offset.zero;
  bool _isHovering = false;

  void _updateLocation(PointerEvent event) {
    setState(() {
      _mousePosition = event.position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: _updateLocation,
      child: Stack(
        children: [
          widget.child,
          // We can't globally detect hover on specific elements easily without Provider or global state,
          // so for now we'll just have the small cursor.
          Positioned(
            left: _mousePosition.dx - 5,
            top: _mousePosition.dy - 5,
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: _isHovering ? 48 : 10,
                height: _isHovering ? 48 : 10,
                decoration: BoxDecoration(
                  color: AppColors.lime,
                  shape: BoxShape.circle,
                ),
                // In Flutter, BlendMode.difference can be achieved using ColorFiltered but it's complex for the whole screen.
              ),
            ),
          ),
        ],
      ),
    );
  }
}
