import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:nexgai_website/about_us/about_us.dart';
import 'package:nexgai_website/contact_us/contact_us.dart';
import 'package:nexgai_website/footer/footer.dart';
import 'package:nexgai_website/home_page/home_page_body/home_page_body.dart';
import 'package:nexgai_website/our_services/our_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getScreens() {
    switch (_selectedIndex) {
      case 0:
        return const HomePageBody();
      case 1:
        return const AboutUs();
      case 2:
        return const OurServices();
      case 4:
        return const ContactUsPage();
      default:
        return const HomePageBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Column(
          children: [
            HomePageHeader(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _getScreens(),
                    const FooterMain(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ===== HEADER DESIGN WITH ANIMATIONS =====
class HomePageHeader extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const HomePageHeader({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader>
    with TickerProviderStateMixin {
  bool _isMenuExpanded = false;
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() => _isMenuExpanded = !_isMenuExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 1200;

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF000000),
            Color(0xFF0F0C29),
            Color(0xFF1A0B3D),
          ],
          stops: [0.0, 0.5, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6A11CB).withOpacity(0.3),
            blurRadius: 25,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: const Color(0xFF2575FC).withOpacity(0.2),
            blurRadius: 35,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.05),
                  Colors.black.withOpacity(0.2),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFF6A11CB).withOpacity(0.3),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                _buildMainRow(width, isDesktop),
                if (!isDesktop) _buildMobileMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainRow(double width, bool isDesktop) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        width > 600 ? 60 : 15,
        width > 600 ? 25 : 15,
        width > 600 ? 60 : 15,
        width > 600 ? 25 : 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildLogo(),
          const SizedBox(width: 30),
          if (!isDesktop) const Spacer(),
          if (isDesktop) Expanded(child: _buildDesktopMenu()),
          if (isDesktop) const SizedBox(width: 30),
          if (isDesktop) _buildDesktopCTA(),
          if (!isDesktop) _buildMobileMenuButton(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.05),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF6A11CB).withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6A11CB).withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF6A11CB),
                  Color(0xFF2575FC),
                  Color(0xFFB721FF),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6A11CB).withOpacity(0.4),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Icon(
              Icons.psychology_alt,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFB721FF),
                Color(0xFF6A11CB),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Text(
              'NexGAI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildNavItem("Home", 0),
        _buildNavItem("About Us", 1),
        _buildNavItem("Our Services", 2),
        _buildNavItem("Contact Us", 4),
      ],
    );
  }

  Widget _buildNavItem(String text, int index) {
    final isSelected = widget.selectedIndex == index;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => widget.onItemTapped(index),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: isSelected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF6A11CB).withOpacity(0.3),
                      const Color(0xFF2575FC).withOpacity(0.2),
                    ],
                  ),
                  border: Border.all(
                    color: const Color(0xFF6A11CB).withOpacity(0.5),
                  ),
                )
              : null,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected
                  ? Colors.white
                  : Colors.white.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopCTA() {
    return AnimatedBuilder(
      animation: _glowController,
      builder: (context, child) {
        final glowIntensity = 0.3 + (_glowController.value * 0.4);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF6A11CB),
                Color(0xFF2575FC),
                Color(0xFFB721FF),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6A11CB).withOpacity(glowIntensity),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () => widget.onItemTapped(4),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileMenuButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.05),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF6A11CB).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: _toggleMenu,
        icon: Icon(
          _isMenuExpanded ? Icons.close : Icons.menu_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMobileMenu() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: _isMenuExpanded ? null : 0,
      child: Column(
        children: [
          _buildMobileNavItem("Home", 0, Icons.home_outlined),
          _buildMobileNavItem("About Us", 1, Icons.info_outline),
          _buildMobileNavItem("Our Services", 2, Icons.work_outline),
          _buildMobileNavItem("Contact Us", 4, Icons.contact_mail_outlined),
        ],
      ),
    );
  }

  Widget _buildMobileNavItem(String text, int index, IconData icon) {
    final isSelected = widget.selectedIndex == index;
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.9),
        ),
      ),
      onTap: () {
        _toggleMenu();
        widget.onItemTapped(index);
      },
    );
  }
}
