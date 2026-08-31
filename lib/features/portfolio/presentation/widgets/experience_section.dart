import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:abhishek_dev/core/widgets/reveal_animation.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final bgColor = AppColors.bg(context);
    final surfaceColor = AppColors.surface(context);
    final accentColor = AppColors.accent(context);
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final lineBorder = AppColors.line(context);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RevealAnimation(
                child: Row(
                  children: [
                    Container(width: 20, height: 1, color: accentColor),
                    const SizedBox(width: 10),
                    Text(
                      'EXPERIENCE',
                      style: AppTheme.jetBrainsMono.copyWith(
                        fontSize: 10.4,
                        letterSpacing: 3.2,
                        color: accentColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RevealAnimation(
                delay: const Duration(milliseconds: 100),
                child: RichText(
                  text: TextSpan(
                    style: AppTheme.syne.copyWith(
                      fontSize: isMobile ? 38.4 : 72,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                      letterSpacing: -0.01,
                      color: textColor,
                    ),
                    children: [
                      const TextSpan(text: "Where I've "),
                      TextSpan(
                        text: 'worked',
                        style: TextStyle(fontStyle: FontStyle.italic, color: textSubtleColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48),
              RevealAnimation(
                delay: const Duration(milliseconds: 200),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 28 : 60,
                    vertical: isMobile ? 36 : 60,
                  ),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    border: Border.all(color: lineBorder),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: isMobile ? -36 : -60,
                        bottom: isMobile ? -36 : -60,
                        left: isMobile ? -28 : -60,
                        child: Container(
                          width: 3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [accentColor, Colors.transparent],
                            ),
                          ),
                        ),
                      ),
                      isMobile
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLeft(context),
                                const SizedBox(height: 32),
                                _buildRight(context, isMobile),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 1, child: _buildLeft(context)),
                                const SizedBox(width: 80),
                                Expanded(flex: 2, child: _buildRight(context, isMobile)),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeft(BuildContext context) {
    final textColor = AppColors.text(context);
    final accentColor = AppColors.accent(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter Developer',
          style: AppTheme.syne.copyWith(
            fontSize: 38.4,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.1,
            color: textColor,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'PRODUCTION · GOVERNMENT & ENTERPRISE',
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 10.4,
            letterSpacing: 2.4,
            color: accentColor,
          ),
        ),
      ],
    );
  }

  Widget _buildRight(BuildContext context, bool isMobile) {
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppTheme.inter.copyWith(
              fontSize: 15.3,
              height: 1.82,
              color: textSubtleColor,
            ),
            children: [
              const TextSpan(text: 'Built and shipped multiple '),
              TextSpan(text: 'production-level mobile applications', style: TextStyle(color: textColor, fontWeight: FontWeight.w600)),
              const TextSpan(text: ' serving real users across government departments and enterprise clients. Handled the full lifecycle — from architecture decisions and feature development to Play Store & App Store deployment.'),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildHighlight(context, 'Domains', 'Forestry · GIS · Healthcare · Insurance', isMobile),
            _buildHighlight(context, 'Deployment', 'Play Store & App Store, live in production', isMobile),
            _buildHighlight(context, 'Architecture', 'Bloc, Provider, Clean Architecture', isMobile),
            _buildHighlight(context, 'DevOps', 'Fastlane + GitHub Actions CI/CD', isMobile),
          ],
        ),
      ],
    );
  }

  Widget _buildHighlight(BuildContext context, String label, String val, bool isMobile) {
    final accentColor = AppColors.accent(context);
    final textSubtleColor = AppColors.textSubtle(context);

    return Container(
      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.04),
        border: Border.all(color: accentColor.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: AppTheme.jetBrainsMono.copyWith(
              fontSize: 9.6,
              letterSpacing: 1.92,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            val,
            style: AppTheme.inter.copyWith(
              fontSize: 13.4,
              color: textSubtleColor,
            ),
          ),
        ],
      ),
    );
  }
}
