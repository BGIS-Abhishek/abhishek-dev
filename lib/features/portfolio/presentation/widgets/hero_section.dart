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
    final double minHeroHeight = isMobile ? size.height : (size.height < 760 ? 700.0 : size.height);

    return Container(
      constraints: BoxConstraints(
        minHeight: minHeroHeight,
        maxWidth: double.infinity,
      ),
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
              style: AppTheme.syne.copyWith(
                fontSize: isMobile ? size.width * 0.25 : (size.height * 0.26).clamp(140.0, 220.0),
                fontWeight: FontWeight.w800,
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
                  isMobile ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: isMobile ? 100 : (size.height * 0.11).clamp(80.0, 115.0)),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildEyebrow(context),
                        SizedBox(height: isMobile ? 24 : (size.height * 0.035).clamp(20.0, 32.0)),
                        _buildHeadline(context, isMobile, size),
                        SizedBox(height: isMobile ? 32 : (size.height * 0.04).clamp(24.0, 40.0)),
                        _buildSubRow(context, isMobile, size),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 40 : (size.height * 0.05).clamp(32.0, 60.0)),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1300),
                    child: _buildBottom(context, isMobile),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEyebrow(BuildContext context) {
    final accentColor = AppColors.accent(context);
    final textSubtleColor = AppColors.textSubtle(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const _BlinkingDot(),
        const SizedBox(width: 14),
        Text(
          'MUMBAI, INDIA',
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 11,
            letterSpacing: 2.8,
            color: textSubtleColor,
          ),
        ),
        const SizedBox(width: 14),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.12),
            border: Border.all(color: accentColor.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            'OPEN TO FREELANCE',
            style: AppTheme.jetBrainsMono.copyWith(
              fontSize: 10.5,
              letterSpacing: 1.6,
              color: accentColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeadline(BuildContext context, bool isMobile, Size size) {
    final double rawFontSize = isMobile 
        ? size.width * 0.18 
        : (size.height * 0.135).clamp(64.0, 128.0);
    final double fontSize = rawFontSize.clamp(48.0, 128.0);
    final textColor = AppColors.text(context);
    final accentColor = AppColors.accent(context);

    return RichText(
      text: TextSpan(
        style: AppTheme.syne.copyWith(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          height: 0.95,
          letterSpacing: -0.02,
        ),
        children: [
          TextSpan(text: 'Abhishek\n', style: TextStyle(color: textColor)),
          TextSpan(
              text: 'Yadav\n',
              style: TextStyle(
                  color: accentColor, fontStyle: FontStyle.italic)),
          TextSpan(
            text: 'Developer',
            style: TextStyle(
              color: textColor.withOpacity(0.25),
              shadows: [
                Shadow(
                  offset: const Offset(1, 1),
                  color: textColor.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubRow(BuildContext context, bool isMobile, Size size) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDesc(context),
          const SizedBox(height: 32),
          _buildActions(isMobile: true),
        ],
      );
    }
    final double gap = size.width < 1100 ? 24 : 48;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 900),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _buildDesc(context)),
          SizedBox(width: gap),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomLeft, child: _buildActions(isMobile: false))),
        ],
      ),
    );
  }

  Widget _buildDesc(BuildContext context) {
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380),
      child: RichText(
        text: TextSpan(
          style: AppTheme.inter.copyWith(
            fontSize: 16,
            height: 1.75,
            color: textSubtleColor,
          ),
          children: [
            TextSpan(
                text: 'Flutter Developer',
                style: TextStyle(
                    color: textColor, fontWeight: FontWeight.w600)),
            const TextSpan(
                text:
                    ' crafting production-level mobile apps for Android & iOS. Specialized in '),
            TextSpan(
                text: 'clean architecture',
                style: TextStyle(
                    color: textColor, fontWeight: FontWeight.w600)),
            const TextSpan(
                text: ', real-time systems, and government-grade solutions.'),
          ],
        ),
      ),
    );
  }

  Widget _buildActions({bool isMobile = false}) {
    return Wrap(
      spacing: isMobile ? 10 : 14,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _HoverButton(
          text: 'SEE MY WORK',
          icon: Icons.arrow_forward,
          isPrimary: true,
          onTap: onWorkPressed,
          isMobile: isMobile,
        ),
        _HoverButton(
          text: 'GET IN TOUCH',
          isPrimary: false,
          onTap: onContactPressed,
          isMobile: isMobile,
        ),
      ],
    );
  }

  Widget _buildBottom(BuildContext context, bool isMobile) {
    final line = AppColors.line(context);
    return Container(
      padding: const EdgeInsets.only(top: 60),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: line)),
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
                _buildStat(context, '5+', 'APPS SHIPPED', isMobile),
                _buildStat(context, '2', 'PLATFORMS', isMobile),
                _buildStat(context, 'Gov', 'GRADE PROJECTS', isMobile),
                _buildStat(context, '∞', 'LINES OF DART', isMobile),
              ],
            ),
          ),
          const SizedBox(width: 24),
          _buildScrollHint(context),
        ],
      ),
    );
  }

  Widget _buildStat(BuildContext context, String num, String lbl, bool isMobile) {
    final accentColor = AppColors.accent(context);
    final textCaptionColor = AppColors.textCaption(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          num,
          style: AppTheme.syne.copyWith(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            color: accentColor,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          lbl,
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 9.6,
            letterSpacing: 2.2,
            color: textCaptionColor,
          ),
        ),
      ],
    );
  }

  Widget _buildScrollHint(BuildContext context) {
    final textCaptionColor = AppColors.textCaption(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _ScrollLine(),
        const SizedBox(height: 8),
        Text(
          'SCROLL',
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 9.2,
            letterSpacing: 2.2,
            color: textCaptionColor,
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
    final accentColor = AppColors.accent(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: 0.3 + (_controller.value * 0.7),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: accentColor,
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
    final accentColor = AppColors.accent(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: 0.3 + (_controller.value * 0.7),
          child: Container(
            width: 1,
            height: 44,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [accentColor, Colors.transparent],
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
  final bool isMobile;
  final VoidCallback onTap;

  const _HoverButton({
    required this.text,
    this.icon,
    required this.isPrimary,
    this.isMobile = false,
    required this.onTap,
  });

  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = widget.isMobile
        ? (widget.isPrimary ? 16.0 : 14.0)
        : (widget.isPrimary ? 28.0 : 24.0);
    final verticalPadding = widget.isMobile ? 12.0 : 14.0;
    final fontSize = widget.isMobile ? 11.5 : 12.8;

    final accentColor = AppColors.accent(context);
    final accentHoverColor = AppColors.accentHover(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final line2Color = AppColors.line2(context);
    final isDarkTheme = AppColors.isDark(context);

    final primaryTextColor = isDarkTheme ? AppColors.darkInk : Colors.white;
    final ghostTextColor = _isHovered ? accentColor : textSubtleColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.translationValues(0, _isHovered ? -2.0 : 0.0, 0),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isHovered ? accentHoverColor : accentColor)
                : Colors.transparent,
            border: Border.all(
              color: widget.isPrimary
                  ? Colors.transparent
                  : (_isHovered
                      ? accentColor
                      : line2Color),
            ),
            borderRadius: BorderRadius.circular(2),
            boxShadow: _isHovered && widget.isPrimary
                ? [
                    BoxShadow(
                      color: accentColor.withOpacity(0.25),
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
                  size: widget.isMobile ? 13 : 14,
                  color: widget.isPrimary ? primaryTextColor : ghostTextColor,
                ),
                SizedBox(width: widget.isMobile ? 6 : 10),
              ],
              Text(
                widget.text,
                style: AppTheme.inter.copyWith(
                  fontSize: fontSize,
                  fontWeight:
                      widget.isPrimary ? FontWeight.w700 : FontWeight.w600,
                  letterSpacing: widget.isMobile ? 0.5 : 0.96,
                  color: widget.isPrimary
                      ? primaryTextColor
                      : ghostTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
