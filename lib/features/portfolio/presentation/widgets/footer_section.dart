import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 48,
        vertical: isMobile ? 20 : 28,
      ),
      decoration: BoxDecoration(
        color: AppColors.ink2,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildLogo(),
                const SizedBox(height: 10),
                _buildCopy(
                    '© ${DateTime.now().year} Abhishek Yadav · Flutter Developer · Mumbai'),
                const SizedBox(height: 10),
                _buildCopy('Built with Flutter passion ✦'),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogo(),
                _buildCopy(
                    '© ${DateTime.now().year} Abhishek Yadav · Flutter Developer · Mumbai'),
                _buildCopy('Built with Flutter passion ✦'),
              ],
            ),
    );
  }

  Widget _buildLogo() {
    return RichText(
      text: TextSpan(
        style: AppTheme.syne.copyWith(
          fontSize: 12, // 0.75rem
          fontWeight: FontWeight.w700,
          letterSpacing: 2.16, // 0.18em
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
        fontSize: 9.9, // 0.62rem
        letterSpacing: 1.28, // 0.08em
        color: AppColors.muted,
      ),
    );
  }
}
