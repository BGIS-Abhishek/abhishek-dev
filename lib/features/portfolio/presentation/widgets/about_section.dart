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

    return Container(
      width: double.infinity,
      color: AppColors.ink,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 80 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: RevealAnimation(
            isLeft: true,
            child: _buildLeftCol(),
          ),
        ),
        const SizedBox(width: 80),
        Expanded(
          flex: 15, // Approx 1.5 ratio -> 10 to 15
          child: _buildRightCol(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RevealAnimation(isLeft: true, child: _buildLeftCol()),
        const SizedBox(height: 40),
        _buildRightCol(),
      ],
    );
  }

  Widget _buildLeftCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 20, height: 1, color: AppColors.lime),
            const SizedBox(width: 10),
            Text(
              'WHO I AM',
              style: AppTheme.jetBrainsMono.copyWith(
                fontSize: 10.4, // ~0.65rem
                letterSpacing: 3.2, // 0.2em
                color: AppColors.lime,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: AppTheme.instrumentSerif.copyWith(
              fontSize: 56, // clamp(2.4rem, 5vw, 4.5rem)
              height: 1.05,
              letterSpacing: -0.01,
              color: AppColors.textMain,
            ),
            children: const [
              TextSpan(text: 'Building apps\n'),
              TextSpan(
                text: 'that ship',
                style: TextStyle(fontStyle: FontStyle.italic, color: AppColors.muted2),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRightCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RevealAnimation(
          delay: const Duration(milliseconds: 100),
          child: _buildParagraph(
            "I'm a ",
            bold1: "Flutter Developer",
            text2: " with hands-on experience building production-level mobile applications used by real people — from Kerala Forest Department rangers tagging trees in the field, to senior citizens accessing healthcare from their doorstep.",
          ),
        ),
        const SizedBox(height: 24),
        RevealAnimation(
          delay: const Duration(milliseconds: 200),
          child: _buildParagraph(
            "My edge is in ",
            bold1: "scalable architecture",
            text2: " — I don't just make things work, I make them maintainable. Bloc, Provider, clean code separation, CI/CD pipelines. I care about the codebase three years from now, not just the demo.",
          ),
        ),
        const SizedBox(height: 24),
        RevealAnimation(
          delay: const Duration(milliseconds: 300),
          child: _buildParagraph(
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
            children: [
              _buildPill('Flutter & Dart'),
              _buildPill('Bloc Pattern'),
              _buildPill('Provider'),
              _buildPill('WebSocket'),
              _buildPill('REST APIs'),
              _buildPill('Firebase'),
              _buildPill('SQLite · Hive'),
              _buildPill('Fastlane'),
              _buildPill('GitHub Actions'),
              _buildPill('GIS Mapping'),
              _buildPill('MongoDB'),
            ],
          ),
        ),
        const SizedBox(height: 48),
        RevealAnimation(
          delay: const Duration(milliseconds: 500),
          child: _buildCodeBlock(),
        ),
      ],
    );
  }

  Widget _buildParagraph(String text1, {required String bold1, required String text2}) {
    return RichText(
      text: TextSpan(
        style: AppTheme.syne.copyWith(
          fontSize: 16.8, // 1.05rem
          height: 1.85,
          color: const Color(0xFF9A968E),
        ),
        children: [
          TextSpan(text: text1),
          TextSpan(text: bold1, style: const TextStyle(color: AppColors.textMain, fontWeight: FontWeight.w600)),
          TextSpan(text: text2),
        ],
      ),
    );
  }

  Widget _buildPill(String text) {
    return _HoverPill(text: text);
  }

  Widget _buildCodeBlock() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.ink2,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SelectableText.rich(
        TextSpan(
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 12.5, // 0.78rem
            height: 1.9,
            color: const Color(0xFF6B6B6B),
          ),
          children: const [
            TextSpan(text: '// Abhishek\'s approach to every project\n', style: TextStyle(color: Color(0xFF3D3D3D), fontStyle: FontStyle.italic)),
            TextSpan(text: 'class ', style: TextStyle(color: Color(0xFFC8F041))),
            TextSpan(text: 'AbhishekYadav ', style: TextStyle(color: Color(0xFF82B4FF))),
            TextSpan(text: 'extends ', style: TextStyle(color: Color(0xFFC8F041))),
            TextSpan(text: 'FlutterDeveloper ', style: TextStyle(color: Color(0xFF82B4FF))),
            TextSpan(text: '{\n'),
            TextSpan(text: '  final ', style: TextStyle(color: Color(0xFFC8F041))),
            TextSpan(text: 'architecture = '),
            TextSpan(text: "'Clean + Scalable'", style: TextStyle(color: Color(0xFFE8A87C))),
            TextSpan(text: ';\n'),
            TextSpan(text: '  final ', style: TextStyle(color: Color(0xFFC8F041))),
            TextSpan(text: 'platforms = ['),
            TextSpan(text: "'Android'", style: TextStyle(color: Color(0xFFE8A87C))),
            TextSpan(text: ', '),
            TextSpan(text: "'iOS'", style: TextStyle(color: Color(0xFFE8A87C))),
            TextSpan(text: '];\n'),
            TextSpan(text: '  final ', style: TextStyle(color: Color(0xFFC8F041))),
            TextSpan(text: 'passion = '),
            TextSpan(text: "'Real-world impact'", style: TextStyle(color: Color(0xFFE8A87C))),
            TextSpan(text: ';\n\n'),
            TextSpan(text: '  build', style: TextStyle(color: Color(0xFF82B4FF))),
            TextSpan(text: '(Idea idea) => '),
            TextSpan(text: 'ProductionApp', style: TextStyle(color: Color(0xFF82B4FF))),
            TextSpan(text: '(idea);\n}'),
          ],
        ),
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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.lime.withOpacity(0.05) : Colors.transparent,
          border: Border.all(color: _isHovered ? AppColors.lime : AppColors.border2),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          widget.text,
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 10.8, // 0.68rem
            letterSpacing: 1.28, // 0.08em
            color: _isHovered ? AppColors.lime : const Color(0xFF9A968E),
          ),
        ),
      ),
    );
  }
}
