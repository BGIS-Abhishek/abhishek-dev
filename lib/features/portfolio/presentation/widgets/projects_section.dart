import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
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
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 56,
        vertical: isMobile ? 72 : 110,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RevealAnimation(
                isLeft: true,
                child: _buildHeader(context, isMobile),
              ),
              const SizedBox(height: 48),
              _buildProjectsGrid(context, isMobile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    final textColor = AppColors.text(context);
    final textSubtleColor = AppColors.textSubtle(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Latest Works',
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 32 : 46,
                fontWeight: FontWeight.w800,
                color: textColor,
                letterSpacing: -1.0,
                height: 1.15,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Selected mobile apps, GIS solutions & production architecture',
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w400,
                color: textSubtleColor,
              ),
            ),
          ],
        ),
        if (!isMobile)
          InkWell(
            onTap: () async {
              final uri = Uri.parse('https://github.com/BGIS-Abhishek');
              if (await canLaunchUrl(uri)) launchUrl(uri);
            },
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Explore More on GitHub',
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.teal,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.teal),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProjectsGrid(BuildContext context, bool isMobile) {
    final projects = [
      _ProjectData(
        title: 'Tigram Mobile',
        category: 'GOVERNMENT · TIMBER TRACEABILITY',
        client: 'Kerala Forest Department',
        description:
            'A mission-critical enterprise timber verification platform deployed across field checkposts. Integrates QR scanning, GPS-based tree tracking, offline-first SQLite sync, and secure verification backend.',
        cardColor: const Color(0xFFF3A93B), // Warm amber yellow
        textColor: const Color(0xFF1B2738),
        tags: ['Flutter', 'BLoC', 'GPS & QR', 'Offline Sync', 'REST API'],
        icon: Icons.forest_rounded,
        screenMockupType: _MockupType.timberApp,
        statNumber: '10k+',
        statLabel: 'Field logs verified',
      ),
      _ProjectData(
        title: 'GIS Tree Census',
        category: 'SPATIAL MAPPING & GEO-SURVEY',
        client: 'Forest & Urban Planning',
        description:
            'Spatial survey app with polygon boundary geofencing, sub-meter GPS location accuracy, live camera tagging, and geospatial vector layers for field researchers.',
        cardColor: const Color(0xFF267365), // Deep Forest Teal
        textColor: Colors.white,
        tags: ['Flutter', 'Google Maps / OSM', 'GeoJSON', 'Fastlane', 'Camera API'],
        icon: Icons.map_rounded,
        screenMockupType: _MockupType.gisApp,
        statNumber: '50k+',
        statLabel: 'Trees geo-tagged',
      ),
      _ProjectData(
        title: 'Field Workforce Dispatch',
        category: 'LOGISTICS & REAL-TIME DISPATCH',
        client: 'BGIS Operations',
        description:
            'Real-time workforce management mobile suite featuring live background telemetry, WebSocket incident alerts, automated shift logging, and encrypted sync.',
        cardColor: const Color(0xFFE86043), // Warm Terracotta Coral
        textColor: Colors.white,
        tags: ['Flutter', 'WebSocket', 'Background Service', 'SQLite', 'Clean Arch'],
        icon: Icons.navigation_rounded,
        screenMockupType: _MockupType.dispatchApp,
        statNumber: '99.9%',
        statLabel: 'Uptime reliability',
      ),
    ];

    if (isMobile) {
      return Column(
        children: projects
            .map((p) => Padding(
                  padding: const EdgeInsets.only(bottom: 28),
                  child: _ProjectCard(project: p, isMobile: true),
                ))
            .toList(),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < projects.length; i++) ...[
              if (i > 0) const SizedBox(width: 24),
              Expanded(
                child: RevealAnimation(
                  delay: Duration(milliseconds: 100 * (i + 1)),
                  child: _ProjectCard(project: projects[i], isMobile: false),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

enum _MockupType { timberApp, gisApp, dispatchApp }

class _ProjectData {
  final String title;
  final String category;
  final String client;
  final String description;
  final Color cardColor;
  final Color textColor;
  final List<String> tags;
  final IconData icon;
  final _MockupType screenMockupType;
  final String statNumber;
  final String statLabel;

  _ProjectData({
    required this.title,
    required this.category,
    required this.client,
    required this.description,
    required this.cardColor,
    required this.textColor,
    required this.tags,
    required this.icon,
    required this.screenMockupType,
    required this.statNumber,
    required this.statLabel,
  });
}

class _ProjectCard extends StatefulWidget {
  final _ProjectData project;
  final bool isMobile;

  const _ProjectCard({
    required this.project,
    required this.isMobile,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  void _showDetailsDialog(BuildContext context) {
    final p = widget.project;
    final isDark = AppColors.isDark(context);
    final dialogBg = isDark ? AppColors.darkInk2 : AppColors.cream;
    final textCol = AppColors.text(context);
    final subtleCol = AppColors.textSubtle(context);

    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: dialogBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 540),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: p.cardColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(p.icon, color: p.textColor, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p.title,
                            style: GoogleFonts.dmSans(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: textCol,
                            ),
                          ),
                          Text(
                            p.client,
                            style: GoogleFonts.dmSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: subtleCol,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(ctx),
                      icon: Icon(Icons.close_rounded, color: textCol),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  p.description,
                  style: GoogleFonts.dmSans(
                    fontSize: 15,
                    height: 1.65,
                    color: subtleCol,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: p.tags
                      .map((t) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.isDark(context)
                                  ? const Color(0x1AFFFFFF)
                                  : const Color(0x0F1A2332),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              t,
                              style: GoogleFonts.dmSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: textCol,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: p.cardColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Text(
                        p.statNumber,
                        style: GoogleFonts.dmSans(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: p.cardColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          p.statLabel,
                          style: GoogleFonts.dmSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: textCol,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () => Navigator.pop(ctx),
                    icon: const Icon(Icons.check_rounded, size: 18),
                    label: const Text('Close'),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.teal,
                      textStyle: GoogleFonts.dmSans(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showDetailsDialog(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
          decoration: BoxDecoration(
            color: p.cardColor,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: p.cardColor.withValues(alpha: _isHovered ? 0.35 : 0.20),
                blurRadius: _isHovered ? 28 : 16,
                offset: Offset(0, _isHovered ? 14 : 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top text & title info
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.category,
                      style: GoogleFonts.dmSans(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                        color: p.textColor.withValues(alpha: 0.75),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      p.title,
                      style: GoogleFonts.dmSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                        color: p.textColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      p.client,
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: p.textColor.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),

              // Mockup frame (matching Dribbble card showcase)
              Container(
                height: 220,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 12,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: _buildMockupContent(p),
                ),
              ),

              // Bottom card bar
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 18, 28, 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          p.statNumber,
                          style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: p.textColor,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          p.statLabel,
                          style: GoogleFonts.dmSans(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w500,
                            color: p.textColor.withValues(alpha: 0.80),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: p.textColor.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 16,
                        color: p.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMockupContent(_ProjectData p) {
    switch (p.screenMockupType) {
      case _MockupType.timberApp:
        return _buildTimberMockup();
      case _MockupType.gisApp:
        return _buildGisMockup();
      case _MockupType.dispatchApp:
        return _buildDispatchMockup();
    }
  }

  Widget _buildTimberMockup() {
    return Container(
      color: const Color(0xFFFBFBFB),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E7D32),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.qr_code_scanner_rounded, size: 14, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Tigram Verification',
                    style: GoogleFonts.dmSans(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1B2738),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'SYNCED',
                  style: GoogleFonts.dmSans(
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF2E7D32),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // QR Verification Card
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4F2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  child: const Icon(Icons.qr_code_2_rounded, size: 30, color: Color(0xFF1B2738)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pass #KL-2024-9842',
                        style: GoogleFonts.dmSans(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1B2738),
                        ),
                      ),
                      Text(
                        'Teak Wood · 14.2 m³ · Nilambur',
                        style: GoogleFonts.dmSans(
                          fontSize: 9,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.check_circle_rounded, size: 10, color: Color(0xFF2E7D32)),
                          const SizedBox(width: 4),
                          Text(
                            'GPS Validated at Checkpost',
                            style: GoogleFonts.dmSans(
                              fontSize: 8.5,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2E7D32),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Field records list
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFEEEEEE)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Species Count', style: GoogleFonts.dmSans(fontSize: 8.5, color: const Color(0xFF9E9E9E))),
                      Text('24 Logs', style: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w800, color: const Color(0xFF1B2738))),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFEEEEEE)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Offline Queue', style: GoogleFonts.dmSans(fontSize: 8.5, color: const Color(0xFF9E9E9E))),
                      Text('0 Pending', style: GoogleFonts.dmSans(fontSize: 12, fontWeight: FontWeight.w800, color: const Color(0xFF2E7D32))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGisMockup() {
    return Container(
      color: const Color(0xFFE8F1EE),
      child: Stack(
        children: [
          // Simulated map grid
          Positioned.fill(
            child: CustomPaint(
              painter: _MapGridPainter(),
            ),
          ),
          // Floating search pill
          Positioned(
            top: 12,
            left: 14,
            right: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 8),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.pin_drop_rounded, size: 14, color: Color(0xFF267365)),
                  const SizedBox(width: 6),
                  Text(
                    'Sector 4B · Polygon Boundary #82',
                    style: GoogleFonts.dmSans(fontSize: 9.5, fontWeight: FontWeight.w600, color: const Color(0xFF1B2738)),
                  ),
                ],
              ),
            ),
          ),
          // Floating data card
          Positioned(
            bottom: 12,
            left: 14,
            right: 14,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.10), blurRadius: 10),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF267365).withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.eco_rounded, size: 18, color: Color(0xFF267365)),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ficus Religiosa · DBH: 48cm', style: GoogleFonts.dmSans(fontSize: 10, fontWeight: FontWeight.w700, color: const Color(0xFF1B2738))),
                        Text('Accuracy: ±0.8m · Elevation: 42m', style: GoogleFonts.dmSans(fontSize: 8.5, color: const Color(0xFF757575))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDispatchMockup() {
    return Container(
      color: const Color(0xFFF9F9FB),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Live Dispatch Telemetry',
                style: GoogleFonts.dmSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1B2738),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE86043),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text('LIVE', style: GoogleFonts.dmSans(fontSize: 8.5, fontWeight: FontWeight.w800, color: const Color(0xFFE86043))),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: Row(
              children: [
                const Icon(Icons.route_rounded, size: 24, color: Color(0xFFE86043)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Route B-104 · 8 Waypoints', style: GoogleFonts.dmSans(fontSize: 10, fontWeight: FontWeight.w700, color: const Color(0xFF1B2738))),
                      Text('Status: Field Surveyor En Route', style: GoogleFonts.dmSans(fontSize: 8.5, color: const Color(0xFF757575))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.bolt_rounded, size: 14, color: Color(0xFFE65100)),
                const SizedBox(width: 6),
                Text(
                  'WebSocket: Latency 42ms · Auto-reconnect OK',
                  style: GoogleFonts.dmSans(fontSize: 8.5, fontWeight: FontWeight.w600, color: const Color(0xFFE65100)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFF267365).withValues(alpha: 0.15)
      ..strokeWidth = 1.0;

    for (double x = 0; x < size.width; x += 30) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    }
    for (double y = 0; y < size.height; y += 30) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    // Draw simulated polygon boundary
    final polyPaint = Paint()
      ..color = const Color(0xFF267365).withValues(alpha: 0.25)
      ..style = PaintingStyle.fill;
    final polyBorder = Paint()
      ..color = const Color(0xFF267365)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.3)
      ..lineTo(size.width * 0.8, size.height * 0.25)
      ..lineTo(size.width * 0.7, size.height * 0.75)
      ..lineTo(size.width * 0.3, size.height * 0.8)
      ..close();

    canvas.drawPath(path, polyPaint);
    canvas.drawPath(path, polyBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
