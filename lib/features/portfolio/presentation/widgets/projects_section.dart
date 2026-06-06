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

    return Container(
      width: double.infinity,
      color: AppColors.ink,
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
                child: _buildHeader(isMobile),
              ),
              const SizedBox(height: 60),
              RevealAnimation(
                delay: const Duration(milliseconds: 100),
                child: _buildHighlight(isMobile),
              ),
              const SizedBox(height: 2),
              _buildList(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width: 20, height: 1, color: AppColors.lime),
                const SizedBox(width: 10),
                Text(
                  'SELECTED WORK',
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
                  fontSize: isMobile ? 38.4 : 72, // clamp(2.4rem, 5vw, 4.5rem)
                  height: 1.05,
                  letterSpacing: -0.01,
                  color: AppColors.textMain,
                ),
                children: const [
                  TextSpan(text: 'Projects that\n'),
                  TextSpan(
                    text: 'actually shipped',
                    style: TextStyle(fontStyle: FontStyle.italic, color: AppColors.muted2),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          '05',
          style: AppTheme.instrumentSerif.copyWith(
            fontSize: 80, // 5rem
            fontStyle: FontStyle.italic,
            color: AppColors.border2,
            height: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildHighlight(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.ink2,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(4),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildHighlightLeft(),
                Container(height: 1, color: AppColors.border),
                _buildHighlightRight(isMobile),
              ],
            )
          : IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _buildHighlightLeft()),
                  Container(width: 1, color: AppColors.border),
                  Expanded(child: _buildHighlightRight(isMobile)),
                ],
              ),
            ),
    );
  }

  Widget _buildHighlightLeft() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '✦ HIGHLIGHT PROJECT · KERALA FOREST DEPT.',
            style: AppTheme.jetBrainsMono.copyWith(
              fontSize: 9.9, // 0.62rem
              letterSpacing: 2.88, // 0.18em
              color: AppColors.lime,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Tigram',
            style: AppTheme.instrumentSerif.copyWith(
              fontSize: 48, // 3rem
              fontStyle: FontStyle.italic,
              height: 1.0,
              color: AppColors.textMain,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Timber traceability platform used by the Kerala Forest Department to track and verify timber from forest to market using GPS and QR codes.',
            style: AppTheme.syne.copyWith(
              fontSize: 14.4, // 0.9rem
              height: 1.7,
              color: AppColors.muted2,
            ),
          ),
          const SizedBox(height: 32),
          _buildFeatureItem('GPS-based tree tracking', ' — real-time field data capture'),
          const SizedBox(height: 12),
          _buildFeatureItem('QR code integration', ' — unique ID per timber piece'),
          const SizedBox(height: 12),
          _buildFeatureItem('REST API', ' — synced with government backend systems'),
          const SizedBox(height: 12),
          _buildFeatureItem('Offline-capable', ' — works in low-connectivity forests'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String boldText, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: AppColors.lime.withOpacity(0.12),
            border: Border.all(color: AppColors.lime.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(2),
          ),
          alignment: Alignment.center,
          child: Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              color: AppColors.lime,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTheme.syne.copyWith(
                fontSize: 14, // 0.88rem
                height: 1.5,
                color: const Color(0xFF9A968E),
              ),
              children: [
                TextSpan(text: boldText, style: const TextStyle(color: AppColors.textMain, fontWeight: FontWeight.w600)),
                TextSpan(text: text),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHighlightRight(bool isMobile) {
    return Container(
      color: AppColors.lime.withOpacity(0.04),
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
                  fontSize: 9.9, // 0.62rem
                  letterSpacing: 2.4, // 0.15em
                  color: AppColors.muted,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildTag('Flutter', isHighlight: true),
                  _buildTag('Dart', isHighlight: true),
                  _buildTag('Provider', isHighlight: true),
                  _buildTag('Bloc', isHighlight: true),
                  _buildTag('REST API', isHighlight: true),
                  _buildTag('GPS', isHighlight: true),
                  _buildTag('QR Code', isHighlight: true),
                ],
              ),
            ],
          ),
          SizedBox(height: isMobile ? 32 : 48),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.lime.withOpacity(0.05),
              border: Border.all(color: AppColors.lime.withOpacity(0.12)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IMPACT',
                  style: AppTheme.jetBrainsMono.copyWith(
                    fontSize: 9.6, // 0.6rem
                    letterSpacing: 1.92, // 0.12em
                    color: AppColors.lime,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Live in the field with Kerala Forest Department officers — directly reducing timber fraud through digital traceability.',
                  style: AppTheme.syne.copyWith(
                    fontSize: 14, // 0.88rem
                    height: 1.7,
                    color: const Color(0xFF9A968E),
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

  Widget _buildTag(String text, {bool isHighlight = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        text.toUpperCase(),
        style: AppTheme.jetBrainsMono.copyWith(
          fontSize: 9.6, // 0.6rem
          letterSpacing: 1.28, // 0.08em
          color: const Color(0xFF6B6B6B),
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
          color: _isHovered ? AppColors.ink3 : AppColors.ink2,
          border: Border.all(color: _isHovered ? AppColors.border2 : Colors.transparent),
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
                        color: AppColors.muted,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: AppTheme.instrumentSerif.copyWith(
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                            color: AppColors.textMain,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.desc,
                          style: AppTheme.syne.copyWith(
                            fontSize: 12.8,
                            color: AppColors.muted2,
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
                        color: AppColors.muted,
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
                          style: AppTheme.instrumentSerif.copyWith(
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                            color: AppColors.textMain,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.desc,
                          style: AppTheme.syne.copyWith(
                            fontSize: 12.8,
                            color: AppColors.muted2,
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
                      children: widget.tags.map((t) => _buildTag(t)).toList(),
                    ),
                  ),
                  const SizedBox(width: 32),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isHovered ? 1.0 : 0.0,
                    child: AnimatedSlide(
                      duration: const Duration(milliseconds: 300),
                      offset: _isHovered ? Offset.zero : const Offset(-0.5, 0),
                      child: const Icon(Icons.arrow_forward, color: AppColors.lime, size: 20),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        border: Border.all(color: _isHovered ? AppColors.border2 : AppColors.border),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        text.toUpperCase(),
        style: AppTheme.jetBrainsMono.copyWith(
          fontSize: 9.6,
          letterSpacing: 1.28,
          color: _isHovered ? const Color(0xFF9A968E) : const Color(0xFF6B6B6B),
        ),
      ),
    );
  }
}
