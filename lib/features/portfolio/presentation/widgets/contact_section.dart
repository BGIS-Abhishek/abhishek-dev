import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:abhishek_dev/core/widgets/reveal_animation.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final textColor = AppColors.text(context);
    final accentColor = AppColors.accent(context);
    final textSubtleColor = AppColors.textSubtle(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 80 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: Column(
            children: [
              RevealAnimation(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTheme.syne.copyWith(
                      fontSize: isMobile ? 48 : 128,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                      height: 1.0,
                      letterSpacing: -0.02,
                      color: textColor,
                    ),
                    children: [
                      const TextSpan(text: "Let's build\n"),
                      TextSpan(
                        text: 'something',
                        style: TextStyle(color: accentColor),
                      ),
                      const TextSpan(text: '\nreal.'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              RevealAnimation(
                delay: const Duration(milliseconds: 100),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Text(
                    'Open to freelance projects, collaborations, and anything interesting. Drop a message — I usually reply fast.',
                    textAlign: TextAlign.center,
                    style: AppTheme.inter.copyWith(
                      fontSize: 16,
                      height: 1.8,
                      color: textSubtleColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 56),
              RevealAnimation(
                delay: const Duration(milliseconds: 200),
                child: Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  alignment: WrapAlignment.center,
                  children: const [
                    _ContactLink(
                      icon: Icons.email_outlined,
                      text: 'EMAIL ME',
                      url: 'mailto:yabhishek1906@gmail.com',
                    ),
                    _ContactLink(
                      icon: FontAwesomeIcons.linkedinIn,
                      text: 'LINKEDIN',
                      url:
                          'https://www.linkedin.com/in/abhishek-yadav-417612148',
                    ),
                    _ContactLink(
                      icon: FontAwesomeIcons.github,
                      text: 'GITHUB',
                      url: 'https://github.com/BGIS-Abhishek',
                    ),
                    _ContactLink(
                      icon: FontAwesomeIcons.whatsapp,
                      text: 'WHATSAPP',
                      url: 'https://wa.me/919768661441',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactLink extends StatefulWidget {
  final IconData icon;
  final String text;
  final String url;

  const _ContactLink({
    required this.icon,
    required this.text,
    required this.url,
  });

  @override
  State<_ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<_ContactLink> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final uri = Uri.parse(widget.url);
    try {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (_) {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final accentColor = AppColors.accent(context);
    final surfaceColor = AppColors.surface(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final lineBorder = AppColors.line(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.translationValues(0, _isHovered ? -2.0 : 0.0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: _isHovered
                ? accentColor.withOpacity(0.08)
                : surfaceColor,
            border: Border.all(
                color: _isHovered ? accentColor : lineBorder),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 14,
                color: _isHovered ? accentColor : textSubtleColor,
              ),
              const SizedBox(width: 10),
              Text(
                widget.text,
                style: AppTheme.jetBrainsMono.copyWith(
                  fontSize: 11.2,
                  letterSpacing: 1.6,
                  color: _isHovered ? accentColor : textSubtleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
