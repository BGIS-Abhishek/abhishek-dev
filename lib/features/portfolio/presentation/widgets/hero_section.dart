import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onWorkPressed;
  final VoidCallback onContactPressed;

  const HeroSection({
    super.key,
    required this.onWorkPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final size = MediaQuery.of(context).size;

    return Container(
      height: isMobile ? null : size.height,
      constraints: isMobile
          ? BoxConstraints(minHeight: size.height, maxWidth: double.infinity)
          : BoxConstraints(maxWidth: double.infinity),
      padding: EdgeInsets.fromLTRB(
        isMobile ? 20 : 48,
        0,
        isMobile ? 20 : 48,
        isMobile ? 40 : 48,
      ),
      child: Stack(
        children: [
          // Background Gradients
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.5, -0.2), // Approx 75% 40%
                  radius: 0.7,
                  colors: [
                    AppColors.lime.withOpacity(0.07),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.55],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.6, 0.4), // Approx 20% 70%
                  radius: 0.5,
                  colors: [
                    AppColors.lime.withOpacity(0.04),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.5],
                ),
              ),
            ),
          ),

          // Big Background Text
          Positioned(
            bottom: -40,
            left: -20,
            right: -20,
            child: Text(
              'Flutter',
              maxLines: 1,
              softWrap: false,
              style: AppTheme.instrumentSerif.copyWith(
                fontSize: isMobile ? size.width * 0.25 : 220,
                fontStyle: FontStyle.italic,
                height: 1.0,
                color: Colors.transparent,
                shadows: [
                  Shadow(
                    offset: const Offset(1, 1),
                    color: Colors.white.withOpacity(0.05),
                  ),
                ],
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment:
                  isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                const SizedBox(height: 115),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1300),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEyebrow(),
                      const SizedBox(height: 32),
                      _buildHeadline(isMobile, size),
                      const SizedBox(height: 40),
                      _buildSubRow(isMobile),
                    ],
                  ),
                ),
                if (!isMobile) const Spacer() else const SizedBox(height: 60),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1300),
                    child: _buildBottom(isMobile),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEyebrow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const _BlinkingDot(),
        const SizedBox(width: 14),
        Text(
          'MUMBAI, INDIA',
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 11, // ~0.7rem
            letterSpacing: 2.8, // 0.18em
            color: AppColors.muted2,
          ),
        ),
        const SizedBox(width: 14),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.lime.withOpacity(0.12),
            border: Border.all(color: AppColors.lime.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            'OPEN TO FREELANCE',
            style: AppTheme.jetBrainsMono.copyWith(
              fontSize: 10.5, // ~0.65rem
              letterSpacing: 1.6, // 0.1em
              color: AppColors.lime,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeadline(bool isMobile, Size size) {
    final double fontSize = isMobile ? size.width * 0.18 : 128.0;
    return RichText(
      text: TextSpan(
        style: AppTheme.instrumentSerif.copyWith(
          fontSize: fontSize.clamp(52.0, 128.0),
          height: 0.95,
          letterSpacing: -0.02,
        ),
        children: [
          const TextSpan(
              text: 'Abhishek\n', style: TextStyle(color: AppColors.textMain)),
          const TextSpan(
              text: 'Yadav\n',
              style: TextStyle(
                  color: AppColors.lime, fontStyle: FontStyle.italic)),
          TextSpan(
            text: 'Developer',
            style: TextStyle(
              color: AppColors.textMain.withOpacity(0.25),
              shadows: [
                Shadow(
                  offset: const Offset(1, 1),
                  color: AppColors.textMain.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubRow(bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDesc(),
          const SizedBox(height: 32),
          _buildActions(),
        ],
      );
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _buildDesc()),
          const SizedBox(width: 48),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomLeft, child: _buildActions())),
        ],
      ),
    );
  }

  Widget _buildDesc() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380),
      child: RichText(
        text: TextSpan(
          style: AppTheme.syne.copyWith(
            fontSize: 16,
            height: 1.75,
            color: AppColors.muted2,
          ),
          children: const [
            TextSpan(
                text: 'Flutter Developer',
                style: TextStyle(
                    color: AppColors.textMain, fontWeight: FontWeight.w600)),
            TextSpan(
                text:
                    ' crafting production-level mobile apps for Android & iOS. Specialized in '),
            TextSpan(
                text: 'clean architecture',
                style: TextStyle(
                    color: AppColors.textMain, fontWeight: FontWeight.w600)),
            TextSpan(
                text: ', real-time systems, and government-grade solutions.'),
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _HoverButton(
          text: 'SEE MY WORK',
          icon: Icons.arrow_forward,
          isPrimary: true,
          onTap: onWorkPressed,
        ),
        const SizedBox(width: 14),
        _HoverButton(
          text: 'GET IN TOUCH',
          isPrimary: false,
          onTap: onContactPressed,
        ),
      ],
    );
  }

  Widget _buildBottom(bool isMobile) {
    return Container(
      padding: const EdgeInsets.only(top: 60,),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Wrap(
              spacing: isMobile ? 24 : 48,
              runSpacing: 24,
              children: [
                _buildStat('5+', 'APPS SHIPPED', isMobile),
                _buildStat('2', 'PLATFORMS', isMobile),
                _buildStat('Gov', 'GRADE PROJECTS', isMobile),
                _buildStat('∞', 'LINES OF DART', isMobile),
              ],
            ),
          ),
          const SizedBox(width: 24),
          _buildScrollHint(),
        ],
      ),
    );
  }

  Widget _buildStat(String num, String lbl, bool isMobile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          num,
          style: AppTheme.instrumentSerif.copyWith(
            fontSize: isMobile ? 32 : 48,
            fontStyle: FontStyle.italic,
            color: AppColors.lime,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          lbl,
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 9.6, // ~0.6rem
            letterSpacing: 2.2, // 0.14em
            color: AppColors.muted,
          ),
        ),
      ],
    );
  }

  Widget _buildScrollHint() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _ScrollLine(),
        const SizedBox(height: 8),
        Text(
          'SCROLL',
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 9.2, // ~0.58rem
            letterSpacing: 2.2, // 0.14em
            color: AppColors.muted,
          ),
        ),
      ],
    );
  }
}

class _BlinkingDot extends StatefulWidget {
  const _BlinkingDot();

  @override
  State<_BlinkingDot> createState() => _BlinkingDotState();
}

class _BlinkingDotState extends State<_BlinkingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: 0.3 + (_controller.value * 0.7),
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.lime,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

class _ScrollLine extends StatefulWidget {
  const _ScrollLine();

  @override
  State<_ScrollLine> createState() => _ScrollLineState();
}

class _ScrollLineState extends State<_ScrollLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: 0.3 + (_controller.value * 0.7),
          child: Container(
            width: 1,
            height: 44,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.lime, Colors.transparent],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HoverButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const _HoverButton({
    required this.text,
    this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.translationValues(0, _isHovered ? -2.0 : 0.0, 0),
          padding: widget.isPrimary
              ? const EdgeInsets.symmetric(horizontal: 28, vertical: 14)
              : const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isHovered ? AppColors.lime2 : AppColors.lime)
                : Colors.transparent,
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.transparent
                  : (_isHovered
                      ? Colors.white.withOpacity(0.3)
                      : AppColors.border2),
            ),
            borderRadius: BorderRadius.circular(2),
            boxShadow: _isHovered && widget.isPrimary
                ? [
                    BoxShadow(
                      color: AppColors.lime.withOpacity(0.25),
                      blurRadius: 32,
                      offset: const Offset(0, 12),
                    )
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: 14,
                  color: widget.isPrimary ? AppColors.ink : AppColors.muted2,
                ),
                const SizedBox(width: 10),
              ],
              Text(
                widget.text,
                style: AppTheme.syne.copyWith(
                  fontSize: 12.8, // ~0.8rem
                  fontWeight:
                      widget.isPrimary ? FontWeight.w700 : FontWeight.w600,
                  letterSpacing: 0.96, // 0.06em
                  color: widget.isPrimary
                      ? AppColors.ink
                      : (_isHovered ? AppColors.textMain : AppColors.muted2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
