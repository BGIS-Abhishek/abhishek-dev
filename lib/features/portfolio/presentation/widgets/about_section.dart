import 'package:flutter/material.dart';
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
        const SizedBox(width: 80),
        Expanded(
          flex: 15,
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
      ],
    );
  }

  Widget _buildRightCol(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RevealAnimation(
          delay: const Duration(milliseconds: 100),
          child: _buildParagraph(
            context,
            "I'm a ",
            bold1: "Flutter Developer",
            text2: " with hands-on experience building production-level mobile applications used by real people — from Kerala Forest Department rangers tagging trees in the field, to senior citizens accessing healthcare from their doorstep.",
          ),
        ),
        const SizedBox(height: 24),
        RevealAnimation(
          delay: const Duration(milliseconds: 200),
          child: _buildParagraph(
            context,
            "My edge is in ",
            bold1: "scalable architecture",
            text2: " — I don't just make things work, I make them maintainable. Bloc, Provider, clean code separation, CI/CD pipelines. I care about the codebase three years from now, not just the demo.",
          ),
        ),
        const SizedBox(height: 24),
        RevealAnimation(
          delay: const Duration(milliseconds: 300),
          child: _buildParagraph(
            context,
            "Currently ",
            bold1: "open to freelance projects",
            text2: " and collaborations where I can bring full-stack Flutter expertise to solve meaningful problems.",
          ),
        ),
        const SizedBox(height: 40),
        RevealAnimation(
          delay: const Duration(milliseconds: 400),
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
        const SizedBox(height: 48),
        RevealAnimation(
          delay: const Duration(milliseconds: 500),
          child: _buildCodeBlock(context),
        ),
      ],
    );
  }

  Widget _buildParagraph(BuildContext context, String text1, {required String bold1, required String text2}) {
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);
    return RichText(
      text: TextSpan(
        style: AppTheme.inter.copyWith(
          fontSize: 16.8,
          height: 1.85,
          color: textSubtleColor,
        ),
        children: [
          TextSpan(text: text1),
          TextSpan(text: bold1, style: TextStyle(color: textColor, fontWeight: FontWeight.w600)),
          TextSpan(text: text2),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(BuildContext context) {
    final surfaceColor = AppColors.surface(context);
    final elevatedColor = AppColors.elevated(context);
    final lineBorder = AppColors.line(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final textCaptionColor = AppColors.textCaption(context);
    final accentColor = AppColors.accent(context);

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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: elevatedColor,
              border: Border(bottom: BorderSide(color: lineBorder)),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              children: [
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
                Text(
                  'abhishek_developer.dart',
                  style: AppTheme.jetBrainsMono.copyWith(
                    fontSize: 11,
                    color: textSubtleColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: SelectableText.rich(
              TextSpan(
                style: AppTheme.jetBrainsMono.copyWith(
                  fontSize: 12.5,
                  height: 1.9,
                  color: textSubtleColor,
                ),
                children: [
                  TextSpan(text: '// Abhishek\'s approach to every project\n', style: TextStyle(color: textCaptionColor, fontStyle: FontStyle.italic)),
                  TextSpan(text: 'class ', style: TextStyle(color: accentColor)),
                  const TextSpan(text: 'AbhishekYadav ', style: TextStyle(color: Color(0xFF82B4FF))),
                  TextSpan(text: 'extends ', style: TextStyle(color: accentColor)),
                  const TextSpan(text: 'FlutterDeveloper ', style: TextStyle(color: Color(0xFF82B4FF))),
                  const TextSpan(text: '{\n'),
                  TextSpan(text: '  final ', style: TextStyle(color: accentColor)),
                  const TextSpan(text: 'architecture = '),
                  const TextSpan(text: "'Clean + Scalable'", style: TextStyle(color: Color(0xFFE8A87C))),
                  const TextSpan(text: ';\n'),
                  TextSpan(text: '  final ', style: TextStyle(color: accentColor)),
                  const TextSpan(text: 'platforms = ['),
                  const TextSpan(text: "'Android'", style: TextStyle(color: Color(0xFFE8A87C))),
                  const TextSpan(text: ', '),
                  const TextSpan(text: "'iOS'", style: TextStyle(color: Color(0xFFE8A87C))),
                  const TextSpan(text: '];\n'),
                  TextSpan(text: '  final ', style: TextStyle(color: accentColor)),
                  const TextSpan(text: 'passion = '),
                  const TextSpan(text: "'Real-world impact'", style: TextStyle(color: Color(0xFFE8A87C))),
                  const TextSpan(text: ';\n\n'),
                  const TextSpan(text: '  build', style: TextStyle(color: Color(0xFF82B4FF))),
                  const TextSpan(text: '(Idea idea) => '),
                  const TextSpan(text: 'ProductionApp', style: TextStyle(color: Color(0xFF82B4FF))),
                  const TextSpan(text: '(idea);\n}'),
                ],
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
          borderRadius: BorderRadius.circular(2),
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
