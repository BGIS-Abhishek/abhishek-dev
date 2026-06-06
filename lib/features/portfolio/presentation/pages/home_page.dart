import 'package:flutter/material.dart';
import 'package:abhishek_dev/core/theme/app_colors.dart';
import 'package:abhishek_dev/core/widgets/custom_cursor.dart';
import 'package:abhishek_dev/features/portfolio/presentation/widgets/navbar.dart';
import 'package:abhishek_dev/features/portfolio/presentation/widgets/hero_section.dart';
import 'package:abhishek_dev/features/portfolio/presentation/widgets/marquee_strip.dart';
import 'package:abhishek_dev/features/portfolio/presentation/widgets/about_section.dart';
import 'package:abhishek_dev/features/portfolio/presentation/widgets/skills_section.dart';
import 'package:abhishek_dev/features/portfolio/presentation/widgets/projects_section.dart';
import 'package:abhishek_dev/features/portfolio/presentation/widgets/services_section.dart';
import 'package:abhishek_dev/features/portfolio/presentation/widgets/experience_section.dart';
import 'package:abhishek_dev/features/portfolio/presentation/widgets/contact_section.dart';
import 'package:abhishek_dev/features/portfolio/presentation/widgets/footer_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 60 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (_scrollController.offset <= 60 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  void _scrollTo(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ink,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroSection(
                  onWorkPressed: () => _scrollTo(_workKey),
                  onContactPressed: () => _scrollTo(_contactKey),
                ),
                const MarqueeStrip(),
                Container(
                  key: _aboutKey,
                  color: AppColors.ink,
                  child: const AboutSection(),
                ),
                Container(
                  color: AppColors.ink,
                  child: const SkillsSection(),
                ),
                Container(
                  key: _workKey,
                  color: AppColors.ink,
                  child: const ProjectsSection(),
                ),
                Container(
                  key: _servicesKey,
                  color: AppColors.ink2,
                  child: const ServicesSection(),
                ),
                Container(
                  color: AppColors.ink,
                  child: const ExperienceSection(),
                ),
                Container(
                  key: _contactKey,
                  decoration: BoxDecoration(
                    color: AppColors.ink2,
                    border: Border(top: BorderSide(color: AppColors.border)),
                  ),
                  child: const ContactSection(),
                ),
                const FooterSection(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              isSolid: _isScrolled,
              onAboutTap: () => _scrollTo(_aboutKey),
              onWorkTap: () => _scrollTo(_workKey),
              onServicesTap: () => _scrollTo(_servicesKey),
              onContactTap: () => _scrollTo(_contactKey),
            ),
          ),
        ],
      ),
    );
  }
}
