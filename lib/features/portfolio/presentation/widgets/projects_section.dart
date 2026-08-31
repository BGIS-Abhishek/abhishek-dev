import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/theme/app_theme.dart';
import 'package:abhishek_dev/core/utils/responsive.dart';
import 'package:abhishek_dev/core/widgets/reveal_animation.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final bgColor = AppColors.bg(context);

    return Container(
      width: double.infinity,
      color: bgColor,
      padding: EdgeInsets.fromLTRB(
        isMobile ? 20 : 48,
        0,
        isMobile ? 20 : 48,
        isMobile ? 80 : 120,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RevealAnimation(
                child: _buildHeader(context, isMobile),
              ),
              const SizedBox(height: 60),
              RevealAnimation(
                delay: const Duration(milliseconds: 100),
                child: _buildHighlight(context, isMobile),
              ),
              const SizedBox(height: 2),
              _buildList(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    final accentColor = AppColors.accent(context);
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final line2Color = AppColors.line2(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width: 20, height: 1, color: accentColor),
                const SizedBox(width: 10),
                Text(
                  'SELECTED WORK',
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
                  fontSize: isMobile ? 38.4 : 72,
                  fontWeight: FontWeight.w800,
                  height: 1.05,
                  letterSpacing: -0.01,
                  color: textColor,
                ),
                children: [
                  const TextSpan(text: 'Projects that\n'),
                  TextSpan(
                    text: 'actually shipped',
                    style: TextStyle(fontStyle: FontStyle.italic, color: textSubtleColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          '05',
          style: AppTheme.syne.copyWith(
            fontSize: 80,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
            color: line2Color,
            height: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildHighlight(BuildContext context, bool isMobile) {
    final surfaceColor = AppColors.surface(context);
    final lineBorder = AppColors.line(context);

    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        border: Border.all(color: lineBorder),
        borderRadius: BorderRadius.circular(4),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildHighlightLeft(context),
                Container(height: 1, color: lineBorder),
                _buildHighlightRight(context, isMobile),
              ],
            )
          : IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _buildHighlightLeft(context)),
                  Container(width: 1, color: lineBorder),
                  Expanded(child: _buildHighlightRight(context, isMobile)),
                ],
              ),
            ),
    );
  }

  Widget _buildHighlightLeft(BuildContext context) {
    final accentColor = AppColors.accent(context);
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '✦ HIGHLIGHT PROJECT · KERALA FOREST DEPT.',
            style: AppTheme.jetBrainsMono.copyWith(
              fontSize: 9.9,
              letterSpacing: 2.88,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Tigram',
            style: AppTheme.syne.copyWith(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              height: 1.0,
              color: textColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Timber traceability platform used by the Kerala Forest Department to track and verify timber from forest to market using GPS and QR codes.',
            style: AppTheme.inter.copyWith(
              fontSize: 14.4,
              height: 1.7,
              color: textSubtleColor,
            ),
          ),
          const SizedBox(height: 32),
          _buildFeatureItem(context, 'GPS-based tree tracking', ' — real-time field data capture'),
          const SizedBox(height: 12),
          _buildFeatureItem(context, 'QR code integration', ' — unique ID per timber piece'),
          const SizedBox(height: 12),
          _buildFeatureItem(context, 'REST API', ' — synced with government backend systems'),
          const SizedBox(height: 12),
          _buildFeatureItem(context, 'Offline-capable', ' — works in low-connectivity forests'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, String boldText, String text) {
    final accentColor = AppColors.accent(context);
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.12),
            border: Border.all(color: accentColor.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(2),
          ),
          alignment: Alignment.center,
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: accentColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTheme.inter.copyWith(
                fontSize: 14,
                height: 1.5,
                color: textSubtleColor,
              ),
              children: [
                TextSpan(text: boldText, style: TextStyle(color: textColor, fontWeight: FontWeight.w600)),
                TextSpan(text: text),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHighlightRight(BuildContext context, bool isMobile) {
    final accentColor = AppColors.accent(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final textCaptionColor = AppColors.textCaption(context);

    return Container(
      color: accentColor.withOpacity(0.04),
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TECH STACK',
                style: AppTheme.jetBrainsMono.copyWith(
                  fontSize: 9.9,
                  letterSpacing: 2.4,
                  color: textCaptionColor,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildTag(context, 'Flutter', isHighlight: true),
                  _buildTag(context, 'Dart', isHighlight: true),
                  _buildTag(context, 'Provider', isHighlight: true),
                  _buildTag(context, 'Bloc', isHighlight: true),
                  _buildTag(context, 'REST API', isHighlight: true),
                  _buildTag(context, 'GPS', isHighlight: true),
                  _buildTag(context, 'QR Code', isHighlight: true),
                ],
              ),
            ],
          ),
          SizedBox(height: isMobile ? 32 : 48),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.05),
              border: Border.all(color: accentColor.withOpacity(0.12)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IMPACT',
                  style: AppTheme.jetBrainsMono.copyWith(
                    fontSize: 9.6,
                    letterSpacing: 1.92,
                    color: accentColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Live in the field with Kerala Forest Department officers — directly reducing timber fraud through digital traceability.',
                  style: AppTheme.inter.copyWith(
                    fontSize: 14,
                    height: 1.7,
                    color: textSubtleColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(bool isMobile) {
    return Column(
      children: [
        RevealAnimation(delay: const Duration(milliseconds: 100), child: _buildRow('02', 'Geo Survey', 'Geotagging app for trees & infrastructure', ['Flutter', 'GPS', 'QR Code', 'Real-time'], isMobile)),
        RevealAnimation(delay: const Duration(milliseconds: 200), child: _buildRow('03', 'Ranibagh — Aaple Udyan', 'GIS-based park navigation & mapping system', ['Flutter', 'GIS', 'WebSocket', 'Bloc'], isMobile)),
        RevealAnimation(delay: const Duration(milliseconds: 300), child: _buildRow('04', 'Claim Assure', 'Document management for insurance claims', ['Flutter', 'Image Processing', 'PDF', 'iOS + Android'], isMobile)),
        RevealAnimation(delay: const Duration(milliseconds: 400), child: _buildRow('05', 'Arogya Aplya Dari', 'Healthcare app bringing doorstep care to senior citizens', ['Flutter', 'REST API', 'Cross-platform'], isMobile)),
      ],
    );
  }

  Widget _buildRow(String num, String name, String desc, List<String> tags, bool isMobile) {
    return _HoverProjectRow(
      numText: num,
      name: name,
      desc: desc,
      tags: tags,
      isMobile: isMobile,
    );
  }

  Widget _buildTag(BuildContext context, String text, {bool isHighlight = false}) {
    final textCaptionColor = AppColors.textCaption(context);
    final lineBorder = AppColors.line(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: lineBorder),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        text.toUpperCase(),
        style: AppTheme.jetBrainsMono.copyWith(
          fontSize: 9.6,
          letterSpacing: 1.28,
          color: textCaptionColor,
        ),
      ),
    );
  }
}

class _HoverProjectRow extends StatefulWidget {
  final String numText;
  final String name;
  final String desc;
  final List<String> tags;
  final bool isMobile;

  const _HoverProjectRow({
    required this.numText,
    required this.name,
    required this.desc,
    required this.tags,
    required this.isMobile,
  });

  @override
  State<_HoverProjectRow> createState() => _HoverProjectRowState();
}

class _HoverProjectRowState extends State<_HoverProjectRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = AppColors.surface(context);
    final elevatedColor = AppColors.elevated(context);
    final accentColor = AppColors.accent(context);
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final textCaptionColor = AppColors.textCaption(context);
    final line2Color = AppColors.line2(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 2),
        padding: widget.isMobile
            ? const EdgeInsets.symmetric(horizontal: 28, vertical: 24)
            : const EdgeInsets.symmetric(horizontal: 36, vertical: 28),
        decoration: BoxDecoration(
          color: _isHovered ? elevatedColor : surfaceColor,
          border: Border.all(color: _isHovered ? line2Color : Colors.transparent),
          borderRadius: BorderRadius.circular(4),
        ),
        transform: Matrix4.translationValues(_isHovered && !widget.isMobile ? 8.0 : 0.0, 0, 0),
        child: widget.isMobile
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(
                      widget.numText,
                      style: AppTheme.jetBrainsMono.copyWith(
                        fontSize: 10.4,
                        letterSpacing: 1.6,
                        color: textCaptionColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: AppTheme.syne.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.desc,
                          style: AppTheme.inter.copyWith(
                            fontSize: 12.8,
                            color: textSubtleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      widget.numText,
                      style: AppTheme.jetBrainsMono.copyWith(
                        fontSize: 10.4,
                        letterSpacing: 1.6,
                        color: textCaptionColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: AppTheme.syne.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.desc,
                          style: AppTheme.inter.copyWith(
                            fontSize: 12.8,
                            color: textSubtleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.tags.map((t) => _buildTag(context, t)).toList(),
                    ),
                  ),
                  const SizedBox(width: 32),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isHovered ? 1.0 : 0.0,
                    child: AnimatedSlide(
                      duration: const Duration(milliseconds: 300),
                      offset: _isHovered ? Offset.zero : const Offset(-0.5, 0),
                      child: Icon(Icons.arrow_forward, color: accentColor, size: 20),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildTag(BuildContext context, String text) {
    final lineBorder = AppColors.line(context);
    final line2Border = AppColors.line2(context);
    final textSubtleColor = AppColors.textSubtle(context);
    final textCaptionColor = AppColors.textCaption(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: _isHovered ? line2Border : lineBorder),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        text.toUpperCase(),
        style: AppTheme.jetBrainsMono.copyWith(
          fontSize: 9.6,
          letterSpacing: 1.28,
          color: _isHovered ? textSubtleColor : textCaptionColor,
        ),
      ),
    );
  }
}
