import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  void _scrollToTop(BuildContext context) {
    final ScrollController? controller = PrimaryScrollController.maybeOf(context);
    if (controller != null && controller.hasClients) {
      controller.animateTo(
        0.0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final bgColor = AppColors.bg(context);
    final subtleColor = AppColors.textSubtle(context);
    final borderColor = AppColors.line(context);

    return Container(
      width: double.infinity,
      color: bgColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 56,
        vertical: 32,
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: borderColor)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
                  children: [
                    _buildLogo(context),
                    const SizedBox(height: 12),
                    Text(
                      '© ${DateTime.now().year} Abhishek Yadav. All Rights Reserved.',
                      style: GoogleFonts.dmSans(
                        fontSize: 12.5,
                        color: subtleColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    _buildBackToTop(context),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildLogo(context),
                        const SizedBox(width: 24),
                        Text(
                          '© ${DateTime.now().year} Abhishek Yadav. Built with Flutter Web.',
                          style: GoogleFonts.dmSans(
                            fontSize: 13,
                            color: subtleColor,
                          ),
                        ),
                      ],
                    ),
                    _buildBackToTop(context),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final textColor = AppColors.text(context);
    return Text(
      'Abhishek',
      style: GoogleFonts.caveat(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: textColor,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildBackToTop(BuildContext context) {
    return InkWell(
      onTap: () => _scrollToTop(context),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.arrow_upward_rounded, size: 16, color: AppColors.teal),
            const SizedBox(width: 6),
            Text(
              'Back to top',
              style: GoogleFonts.dmSans(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
