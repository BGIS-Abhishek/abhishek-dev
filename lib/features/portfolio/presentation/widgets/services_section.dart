import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:abhishek_dev/core/widgets/reveal_animation.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.ink2,
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
                      'WHAT I DO',
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
                      TextSpan(text: 'How I can\n'),
                      TextSpan(
                        text: 'help you',
                        style: TextStyle(fontStyle: FontStyle.italic, color: AppColors.muted2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
              RevealAnimation(
                delay: const Duration(milliseconds: 200),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: isMobile
                      ? Column(
                          children: [
                            _buildServiceCard('01', 'Cross-Platform App Development', 'Full Android & iOS apps built from scratch in Flutter — single codebase, native performance, production-ready from day one.'),
                            Container(height: 1, color: AppColors.border),
                            _buildServiceCard('02', 'Figma → Flutter Conversion', 'Pixel-perfect translation of your Figma designs into responsive, animated Flutter interfaces that feel alive.'),
                            Container(height: 1, color: AppColors.border),
                            _buildServiceCard('03', 'API Integration & Backend', 'REST APIs, WebSockets, Firebase — clean, well-structured data layers that scale without becoming a maintenance nightmare.'),
                            Container(height: 1, color: AppColors.border),
                            _buildServiceCard('04', 'App Store Deployment', 'From code to live listing — Play Store & App Store deployment with Fastlane automation and CI/CD pipelines.'),
                            Container(height: 1, color: AppColors.border),
                            _buildServiceCard('05', 'Performance & Bug Fixing', 'Diagnose slow renders, fix memory leaks, resolve crashes. I bring production-grade stability to apps that need a second look.'),
                            Container(height: 1, color: AppColors.border),
                            _buildServiceCard('06', 'Architecture Consulting', 'Bloc, Provider, clean architecture setup for teams who want their codebase to still make sense in two years.'),
                          ],
                        )
                      : Column(
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(child: _buildServiceCard('01', 'Cross-Platform App Development', 'Full Android & iOS apps built from scratch in Flutter — single codebase, native performance, production-ready from day one.')),
                                  Container(width: 1, color: AppColors.border),
                                  Expanded(child: _buildServiceCard('02', 'Figma → Flutter Conversion', 'Pixel-perfect translation of your Figma designs into responsive, animated Flutter interfaces that feel alive.')),
                                  Container(width: 1, color: AppColors.border),
                                  Expanded(child: _buildServiceCard('03', 'API Integration & Backend', 'REST APIs, WebSockets, Firebase — clean, well-structured data layers that scale without becoming a maintenance nightmare.')),
                                ],
                              ),
                            ),
                            Container(height: 1, color: AppColors.border),
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(child: _buildServiceCard('04', 'App Store Deployment', 'From code to live listing — Play Store & App Store deployment with Fastlane automation and CI/CD pipelines.')),
                                  Container(width: 1, color: AppColors.border),
                                  Expanded(child: _buildServiceCard('05', 'Performance & Bug Fixing', 'Diagnose slow renders, fix memory leaks, resolve crashes. I bring production-grade stability to apps that need a second look.')),
                                  Container(width: 1, color: AppColors.border),
                                  Expanded(child: _buildServiceCard('06', 'Architecture Consulting', 'Bloc, Provider, clean architecture setup for teams who want their codebase to still make sense in two years.')),
                                ],
                              ),
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

  Widget _buildServiceCard(String num, String title, String desc) {
    return _HoverServiceCard(numText: num, title: title, desc: desc);
  }
}

class _HoverServiceCard extends StatefulWidget {
  final String numText;
  final String title;
  final String desc;

  const _HoverServiceCard({
    required this.numText,
    required this.title,
    required this.desc,
  });

  @override
  State<_HoverServiceCard> createState() => _HoverServiceCardState();
}

class _HoverServiceCardState extends State<_HoverServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: _isHovered ? AppColors.ink3 : AppColors.ink2,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.numText,
                    style: AppTheme.instrumentSerif.copyWith(
                      fontSize: 64, // 4rem
                      fontStyle: FontStyle.italic,
                      color: Colors.white.withOpacity(0.04),
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.title,
                    style: AppTheme.syne.copyWith(
                      fontSize: 14.4, // 0.9rem
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.64, // 0.04em
                      color: AppColors.textMain,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    widget.desc,
                    style: AppTheme.syne.copyWith(
                      fontSize: 13.4, // 0.84rem
                      height: 1.7,
                      color: const Color(0xFF6B6B6B),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                height: 2,
                color: AppColors.lime,
                transform: Matrix4.identity()..scale(_isHovered ? 1.0 : 0.0, 1.0, 1.0),
                transformAlignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
