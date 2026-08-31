import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';

class MarqueeStrip extends StatefulWidget {
  const MarqueeStrip({super.key});

  @override
  State<MarqueeStrip> createState() => _MarqueeStripState();
}

class _MarqueeStripState extends State<MarqueeStrip> {
  final ScrollController _scrollController = ScrollController();
  bool _isHovering = false;
  bool _isScrolling = false;

  final List<String> _items = [
    "Flutter & Dart",
    "REST API Integration",
    "Bloc & Provider",
    "WebSocket",
    "Clean Architecture",
    "CI/CD · Fastlane",
    "Play Store · App Store",
    "GIS Mapping",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startContinuousScroll();
    });
  }

  void _startContinuousScroll() async {
    if (_isScrolling) return;
    _isScrolling = true;

    while (mounted) {
      if (!_isHovering && _scrollController.hasClients && _scrollController.position.hasContentDimensions) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.offset;
        final distanceRemaining = maxScroll - currentScroll;

        if (distanceRemaining <= 2.0) {
          _scrollController.jumpTo(0.0);
        } else {
          final durationMs = (distanceRemaining * 25).toInt();
          await _scrollController.animateTo(
            maxScroll,
            duration: Duration(milliseconds: durationMs),
            curve: Curves.linear,
          );
        }
      } else {
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }
    _isScrolling = false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onHover(bool hovering) {
    if (_isHovering != hovering) {
      setState(() {
        _isHovering = hovering;
      });
      if (hovering && _scrollController.hasClients) {
        _scrollController.position.hold(() {});
      } else {
        _startContinuousScroll();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return const SizedBox.shrink();
    }

    final accentColor = AppColors.accent(context);

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Container(
        color: accentColor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: SizedBox(
          height: 24,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: Row(
              children: List.generate(8, (_) => _buildGroup(context)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGroup(BuildContext context) {
    final textColor = AppColors.isDark(context) ? AppColors.darkInk : Colors.white;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _items.map((item) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Text(
                item.toUpperCase(),
                style: AppTheme.syne.copyWith(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.9,
                  color: textColor,
                ),
              ),
            ),
            Text(
              '✦',
              style: TextStyle(
                fontSize: 9.6,
                color: textColor,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
