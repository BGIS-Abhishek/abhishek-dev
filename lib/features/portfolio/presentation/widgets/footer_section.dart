import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
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

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 24 : 32,
      ),
      decoration: const BoxDecoration(
        color: AppColors.ink2,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildLogo(),
                const SizedBox(height: 14),
                _buildCopy('© ${DateTime.now().year} Abhishek Yadav · Flutter Developer · Mumbai'),
                const SizedBox(height: 14),
                _buildBackToTop(context),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogo(),
                _buildCopy('© ${DateTime.now().year} Abhishek Yadav · Flutter Developer · Mumbai'),
                _buildBackToTop(context),
              ],
            ),
    );
  }

  Widget _buildLogo() {
    return RichText(
      text: TextSpan(
        style: AppTheme.syne.copyWith(
          fontSize: 12.5,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.16,
          color: AppColors.textMain,
        ),
        children: const [
          TextSpan(text: 'A'),
          TextSpan(
            text: '.',
            style: TextStyle(color: AppColors.lime),
          ),
          TextSpan(text: 'YADAV'),
        ],
      ),
    );
  }

  Widget _buildCopy(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppTheme.jetBrainsMono.copyWith(
        fontSize: 10,
        letterSpacing: 1.28,
        color: AppColors.muted2,
      ),
    );
  }

  Widget _buildBackToTop(BuildContext context) {
    return InkWell(
      onTap: () => _scrollToTop(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.arrow_upward_rounded, size: 14, color: AppColors.lime),
          const SizedBox(width: 6),
          Text(
            'BACK TO TOP',
            style: AppTheme.jetBrainsMono.copyWith(
              fontSize: 10,
              letterSpacing: 1.6,
              color: AppColors.lime,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
