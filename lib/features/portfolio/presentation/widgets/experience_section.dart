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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RevealAnimation(
                child: Row(
                  children: [
                    Container(width: 20, height: 1, color: AppColors.lime),
                    const SizedBox(width: 10),
                    Text(
                      'EXPERIENCE',
                      style: AppTheme.jetBrainsMono.copyWith(
                        fontSize: 10.4,
                        letterSpacing: 3.2,
                        color: AppColors.lime,
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
                    style: AppTheme.instrumentSerif.copyWith(
                      fontSize: isMobile ? 38.4 : 72,
                      height: 1.05,
                      letterSpacing: -0.01,
                      color: AppColors.textMain,
                    ),
                    children: const [
                      TextSpan(text: "Where I've "),
                      TextSpan(
                        text: 'worked',
                        style: TextStyle(fontStyle: FontStyle.italic, color: AppColors.muted2),
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
                    color: AppColors.ink2,
                    border: Border.all(color: AppColors.border),
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
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [AppColors.lime, Colors.transparent],
                            ),
                          ),
                        ),
                      ),
                      isMobile
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildLeft(),
                                const SizedBox(height: 32),
                                _buildRight(isMobile),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 1, child: _buildLeft()),
                                const SizedBox(width: 80),
                                Expanded(flex: 2, child: _buildRight(isMobile)),
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

  Widget _buildLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter Developer',
          style: AppTheme.instrumentSerif.copyWith(
            fontSize: 38.4, // 2.4rem
            fontStyle: FontStyle.italic,
            height: 1.1,
            color: AppColors.textMain,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'PRODUCTION · GOVERNMENT & ENTERPRISE',
          style: AppTheme.jetBrainsMono.copyWith(
            fontSize: 10.4, // 0.65rem
            letterSpacing: 2.4, // 0.15em
            color: AppColors.lime,
          ),
        ),
      ],
    );
  }

  Widget _buildRight(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppTheme.syne.copyWith(
              fontSize: 15.3, // 0.96rem
              height: 1.82,
              color: const Color(0xFF9A968E),
            ),
            children: const [
              TextSpan(text: 'Built and shipped multiple '),
              TextSpan(text: 'production-level mobile applications', style: TextStyle(color: AppColors.textMain, fontWeight: FontWeight.w600)),
              TextSpan(text: ' serving real users across government departments and enterprise clients. Handled the full lifecycle — from architecture decisions and feature development to Play Store & App Store deployment.'),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildHighlight('Domains', 'Forestry · GIS · Healthcare · Insurance', isMobile),
            _buildHighlight('Deployment', 'Play Store & App Store, live in production', isMobile),
            _buildHighlight('Architecture', 'Bloc, Provider, Clean Architecture', isMobile),
            _buildHighlight('DevOps', 'Fastlane + GitHub Actions CI/CD', isMobile),
          ],
        ),
      ],
    );
  }

  Widget _buildHighlight(String label, String val, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.lime.withOpacity(0.04),
        border: Border.all(color: AppColors.lime.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: AppTheme.jetBrainsMono.copyWith(
              fontSize: 9.6, // 0.6rem
              letterSpacing: 1.92, // 0.12em
              color: AppColors.lime,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            val,
            style: AppTheme.syne.copyWith(
              fontSize: 13.4, // 0.84rem
              color: const Color(0xFF9A968E),
            ),
          ),
        ],
      ),
    );
  }
}
