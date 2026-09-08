import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:abhishek_dev/core/widgets/reveal_animation.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final bgColor = AppColors.bg(context);

    return Container(
      width: double.infinity,
      color: bgColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 80 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: RevealAnimation(
            isLeft: true,
            child: _buildLeftCol(context),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 16,
          child: _buildRightCol(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RevealAnimation(isLeft: true, child: _buildLeftCol(context)),
        const SizedBox(height: 40),
        _buildRightCol(context),
      ],
    );
  }

  Widget _buildLeftCol(BuildContext context) {
    final accentColor = AppColors.accent(context);
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 20, height: 1, color: accentColor),
            const SizedBox(width: 10),
            Text(
              'WHO I AM',
              style: AppTheme.jetBrainsMono.copyWith(
                fontSize: 10.4,
                letterSpacing: 3.2,
                color: accentColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: AppTheme.syne.copyWith(
              fontSize: 56,
              fontWeight: FontWeight.w800,
              height: 1.05,
              letterSpacing: -0.01,
              color: textColor,
            ),
            children: [
              const TextSpan(text: 'Building apps\n'),
              TextSpan(
                text: 'that ship',
                style: TextStyle(fontStyle: FontStyle.italic, color: textSubtleColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "I specialize in scalable Flutter architecture, offline-first mobile applications, and high-performance production code designed for real-world impact.",
          style: AppTheme.inter.copyWith(
            fontSize: 15.5,
            height: 1.7,
            color: textSubtleColor,
          ),
        ),
      ],
    );
  }

  Widget _buildRightCol(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Metric Counters Grid
        RevealAnimation(
          delay: const Duration(milliseconds: 100),
          child: const _MetricsGrid(),
        ),
        const SizedBox(height: 36),

        // Hover Tag Cloud
        RevealAnimation(
          delay: const Duration(milliseconds: 250),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _HoverPill(text: 'Flutter & Dart'),
              _HoverPill(text: 'Bloc Pattern'),
              _HoverPill(text: 'Provider'),
              _HoverPill(text: 'WebSocket'),
              _HoverPill(text: 'REST APIs'),
              _HoverPill(text: 'Firebase'),
              _HoverPill(text: 'SQLite · Hive'),
              _HoverPill(text: 'Fastlane'),
              _HoverPill(text: 'GitHub Actions'),
              _HoverPill(text: 'GIS Mapping'),
              _HoverPill(text: 'MongoDB'),
            ],
          ),
        ),
        const SizedBox(height: 44),

        // Interactive IDE & Terminal Playground
        RevealAnimation(
          delay: const Duration(milliseconds: 350),
          child: const _InteractiveIDEPlayground(),
        ),
      ],
    );
  }
}

/// Stat & Metric Highlight Grid
class _MetricsGrid extends StatelessWidget {
  const _MetricsGrid();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final double itemWidth = isMobile
            ? (constraints.maxWidth - 12) / 2
            : (constraints.maxWidth - 36) / 4;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            SizedBox(
              width: itemWidth,
              child: const _MetricCard(
                targetValue: 4,
                suffix: '+',
                label: 'Apps Shipped',
                sublabel: 'Android & iOS Production',
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: const _MetricCard(
                targetValue: 100,
                suffix: 'K+',
                label: 'Users Impacted',
                sublabel: 'Forestry & Healthcare',
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: const _MetricCard(
                targetValue: 99,
                suffix: '.9%',
                label: 'Crash-Free Rate',
                sublabel: 'Clean Architecture Standard',
              ),
            ),
            SizedBox(
              width: itemWidth,
              child: const _MetricCard(
                targetValue: 100,
                suffix: '%',
                label: 'Offline-First',
                sublabel: 'GIS & Local Sync Engine',
              ),
            ),
          ],
        );
      },
    );
  }
}

class _MetricCard extends StatefulWidget {
  final int targetValue;
  final String suffix;
  final String label;
  final String sublabel;

  const _MetricCard({
    required this.targetValue,
    required this.suffix,
    required this.label,
    required this.sublabel,
  });

  @override
  State<_MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<_MetricCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = AppColors.surface(context);
    final accentColor = AppColors.accent(context);
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final lineBorder = AppColors.line(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: surfaceColor,
          border: Border.all(
            color: _isHovered ? accentColor.withOpacity(0.6) : lineBorder,
            width: _isHovered ? 1.5 : 1.0,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: accentColor.withOpacity(0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: widget.targetValue.toDouble()),
              duration: const Duration(milliseconds: 1600),
              curve: Curves.easeOutCubic,
              builder: (context, val, child) {
                return Text(
                  '${val.toInt()}${widget.suffix}',
                  style: AppTheme.syne.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: accentColor,
                    height: 1.1,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              style: AppTheme.syne.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.sublabel,
              style: AppTheme.inter.copyWith(
                fontSize: 11,
                color: textSubtleColor,
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// Interactive IDE & Terminal Playground Widget
class _InteractiveIDEPlayground extends StatefulWidget {
  const _InteractiveIDEPlayground();

  @override
  State<_InteractiveIDEPlayground> createState() => _InteractiveIDEPlaygroundState();
}

class _InteractiveIDEPlaygroundState extends State<_InteractiveIDEPlayground> {
  int _activeTab = 0;
  bool _copied = false;

  final List<Map<String, dynamic>> _tabs = [
    {
      'title': 'developer.dart',
      'icon': Icons.code_rounded,
      'content': '''// Abhishek's Core Development Standard
class AbhishekYadav extends FlutterDeveloper {
  final String architecture = 'Clean + BLoC / Provider';
  final List<String> platforms = ['Android', 'iOS', 'Web'];
  final List<String> coreFocus = ['Offline GIS Engine', 'State Management'];

  ProductionApp build(Idea idea) {
    return ProductionApp(
      scalable: true,
      maintainable: true,
      userCentric: true,
    );
  }
}''',
    },
    {
      'title': 'architecture.yaml',
      'icon': Icons.account_tree_outlined,
      'content': '''# Production Flutter Stack Definition
project: AbhishekPortfolio
developer: Abhishek Yadav
state_management:
  pattern: BLoC / Provider
  clean_architecture: Enabled
data_layer:
  local_storage: Hive / SQLite
  remote_api: REST / WebSocket
gis_engine:
  geotagging: Real-time GPS
  map_caching: Tile-level Offline
ci_cd:
  pipeline: Fastlane + GitHub Actions''',
    },
    {
      'title': 'terminal',
      'icon': Icons.terminal_rounded,
      'content': '''\$ flutter analyze .
[✓] No analyzer issues found! (0.4s)

\$ flutter test
[✓] 18 tests passed across 4 suites!

\$ flutter build apk --release --split-per-abi
[✓] Built build/app/outputs/flutter-apk/app-arm64-v8a-release.apk (18.4 MB)
Status: READY FOR PRODUCTION DEPLOYMENT 🚀''',
    },
  ];

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _tabs[_activeTab]['content'] as String));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final surfaceColor = AppColors.surface(context);
    final elevatedColor = AppColors.elevated(context);
    final lineBorder = AppColors.line(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final accentColor = AppColors.accent(context);

    final currentContent = _tabs[_activeTab]['content'] as String;

    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        border: Border.all(color: lineBorder),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Bar with Window Controls & Tabs
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: elevatedColor,
              border: Border(bottom: BorderSide(color: lineBorder)),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              children: [
                // Window Red/Yellow/Green Buttons
                Row(
                  children: [
                    Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFFF5F56), shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFFFBD2E), shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF27C93F), shape: BoxShape.circle)),
                  ],
                ),
                const SizedBox(width: 16),
                // Tabs
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_tabs.length, (index) {
                        final isSelected = index == _activeTab;
                        return InkWell(
                          onTap: () => setState(() => _activeTab = index),
                          borderRadius: BorderRadius.circular(4),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(right: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: isSelected ? surfaceColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: isSelected ? lineBorder : Colors.transparent,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  _tabs[index]['icon'] as IconData,
                                  size: 13,
                                  color: isSelected ? accentColor : textSubtleColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  _tabs[index]['title'] as String,
                                  style: AppTheme.jetBrainsMono.copyWith(
                                    fontSize: 11,
                                    color: isSelected ? accentColor : textSubtleColor,
                                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                // Copy Button
                InkWell(
                  onTap: _copyToClipboard,
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          _copied ? Icons.check_circle_outline_rounded : Icons.content_copy_rounded,
                          size: 13,
                          color: _copied ? accentColor : textSubtleColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _copied ? 'Copied' : 'Copy',
                          style: AppTheme.jetBrainsMono.copyWith(
                            fontSize: 10.5,
                            color: _copied ? accentColor : textSubtleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Code Display Area
          Padding(
            padding: const EdgeInsets.all(20),
            child: SelectableText(
              currentContent,
              style: AppTheme.jetBrainsMono.copyWith(
                fontSize: 12.5,
                height: 1.85,
                color: _activeTab == 2 ? const Color(0xFF50FA7B) : textSubtleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HoverPill extends StatefulWidget {
  final String text;
  const _HoverPill({required this.text});

  @override
  State<_HoverPill> createState() => _HoverPillState();
}

class _HoverPillState extends State<_HoverPill> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final accentColor = AppColors.accent(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final line2Color = AppColors.line2(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _isHovered ? accentColor.withOpacity(0.08) : Colors.transparent,
          border: Border.all(color: _isHovered ? accentColor : line2Color),
          borderRadius: BorderRadius.circular(4),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: accentColor.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Text(
          widget.text,
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 10.8,
            letterSpacing: 1.28,
            color: _isHovered ? accentColor : textSubtleColor,
          ),
        ),
      ),
    );
  }
}
