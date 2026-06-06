import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:flutter/scheduler.dart';

class MarqueeStrip extends StatefulWidget {
  const MarqueeStrip({super.key});

  @override
  State<MarqueeStrip> createState() => _MarqueeStripState();
}

class _MarqueeStripState extends State<MarqueeStrip> with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  final ScrollController _scrollController = ScrollController();
  bool _isHovering = false;
  double _scrollPosition = 0.0;

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
    _ticker = createTicker((elapsed) {
      if (!_isHovering && _scrollController.hasClients && _scrollController.position.hasContentDimensions) {
        _scrollPosition += 0.5; // Speed
        if (_scrollPosition > _scrollController.position.maxScrollExtent) {
          _scrollPosition = 0.0; // In a real infinite loop, we'd adjust seamlessly. For simplicity, reset.
          _scrollController.jumpTo(0.0);
        } else {
          _scrollController.jumpTo(_scrollPosition);
        }
      }
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return const SizedBox.shrink(); // Hidden on mobile in HTML
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Container(
        color: AppColors.lime,
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: SizedBox(
          height: 24, // Fixed height to prevent unbounded issues
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = _items[index % _items.length];
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Text(
                      item.toUpperCase(),
                      style: AppTheme.syne.copyWith(
                        fontSize: 12.5, // ~0.78rem
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.9, // 0.12em
                        color: AppColors.ink,
                      ),
                    ),
                  ),
                  Text(
                    '✦',
                    style: TextStyle(
                      fontSize: 9.6, // ~0.6rem
                      color: AppColors.ink,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
