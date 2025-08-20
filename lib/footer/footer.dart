import 'package:flutter/material.dart';
import 'package:nexgai_website/utills/utils.dart';
import 'dart:ui';

class FooterMain extends StatefulWidget {
  const FooterMain({super.key});

  @override
  State<FooterMain> createState() => _FooterMainState();
}

class _FooterMainState extends State<FooterMain> with TickerProviderStateMixin {
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (width > 1001) 
          FooterWeB(glowController: _glowController),
        if (width <= 1001) 
          FooterMobile(glowController: _glowController),
      ],
    );
  }
}

class FooterWeB extends StatelessWidget {
  final AnimationController glowController;

  const FooterWeB({super.key, required this.glowController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F0C29),
            Color(0xFF1A1A2E),
            Color(0xFF16213E),
            Color(0xFF0F0C29),
          ],
          stops: [0.0, 0.3, 0.7, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      width: double.infinity,
      child: Stack(
        children: [
          // Animated background glow effects
          ...List.generate(3, (index) =>
            AnimatedBuilder(
              animation: glowController,
              builder: (context, child) {
                return Positioned(
                  left: (index * 300.0) + (glowController.value * 100),
                  top: (index * 150.0) + (glowController.value * 50),
                  child: Container(
                    width: 200 + (index * 50),
                    height: 200 + (index * 50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFF6A11CB).withOpacity(0.08),
                          const Color(0xFF2575FC).withOpacity(0.04),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                // Trust indicators with glassmorphism
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.05),
                        Colors.white.withOpacity(0.02),
                      ],
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _TrustIndicator(
                            icon: Icons.security,
                            text: 'Enterprise-grade Security',
                          ),
                          _TrustIndicator(
                            icon: Icons.support_agent,
                            text: '24/7 AI Support',
                          ),
                          _TrustIndicator(
                            icon: Icons.verified,
                            text: 'ISO 27001 Certified',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                
                // Logo with glow effect
                AnimatedBuilder(
                  animation: glowController,
                  builder: (context, child) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6A11CB).withOpacity(
                              0.3 + (glowController.value * 0.2)
                            ),
                            blurRadius: 30 + (glowController.value * 15),
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color(0xFF6A11CB),
                            Color(0xFF2575FC),
                            Color(0xFFB721FF),
                          ],
                        ).createShader(bounds),
                        child: const Text(
                          'NexGAI',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                
                // Divider with gradient
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        const Color(0xFF6A11CB).withOpacity(0.5),
                        const Color(0xFF2575FC).withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                
                // Footer links
                Container(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _FooterColumn(
                        title: 'AI SOLUTIONS',
                        items: [
                          'Machine Learning',
                          'Computer Vision',
                          'Natural Language',
                          'Predictive Analytics',
                          'Process Automation',
                          'Custom AI Models',
                        ],
                      ),
                      _FooterColumn(
                        title: 'INDUSTRIES',
                        items: [
                          'Healthcare',
                          'Finance',
                          'Manufacturing',
                          'Retail',
                          'Automotive',
                          'Technology',
                          'Education',
                          'Real Estate',
                        ],
                      ),
                      _FooterColumn(
                        title: 'SERVICES',
                        items: [
                          'AI Consulting',
                          'Model Development',
                          'Data Engineering',
                          'MLOps',
                          'Training & Support',
                        ],
                      ),
                      _FooterColumn(
                        title: 'COMPANY',
                        items: [
                          'About Us',
                          'Our Team',
                          'Careers',
                          'Case Studies',
                          'Blog',
                          'Contact',
                        ],
                      ),
                      _FooterColumn(
                        title: 'RESOURCES',
                        items: [
                          'Documentation',
                          'API Reference',
                          'Tutorials',
                          'Webinars',
                          'White Papers',
                          'Community',
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                
                // Bottom section with social links and copyright
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '© 2025 NexGAI. All rights reserved.',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          _SocialIcon(Icons.link, 'LinkedIn'),
                          const SizedBox(width: 20),
                          _SocialIcon(Icons.code, 'GitHub'),
                          const SizedBox(width: 20),
                          _SocialIcon(Icons.article, 'Medium'),
                          const SizedBox(width: 20),
                          _SocialIcon(Icons.alternate_email, 'Twitter'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterMobile extends StatelessWidget {
  final AnimationController glowController;

  const FooterMobile({super.key, required this.glowController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0F0C29),
            Color(0xFF1A1A2E),
            Color(0xFF16213E),
            Color(0xFF0F0C29),
          ],
          stops: [0.0, 0.3, 0.7, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Trust indicators - stacked vertically
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.02),
                  ],
                ),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: const Column(
                children: [
                  _TrustIndicator(
                    icon: Icons.security,
                    text: 'Enterprise-grade Security',
                  ),
                  SizedBox(height: 15),
                  _TrustIndicator(
                    icon: Icons.support_agent,
                    text: '24/7 AI Support',
                  ),
                  SizedBox(height: 15),
                  _TrustIndicator(
                    icon: Icons.verified,
                    text: 'ISO 27001 Certified',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            // Logo
            AnimatedBuilder(
              animation: glowController,
              builder: (context, child) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6A11CB).withOpacity(
                          0.3 + (glowController.value * 0.2)
                        ),
                        blurRadius: 20 + (glowController.value * 10),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color(0xFF6A11CB),
                        Color(0xFF2575FC),
                        Color(0xFFB721FF),
                      ],
                    ).createShader(bounds),
                    child: const Text(
                      'NexGAI',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            
            // Divider
            Container(
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    const Color(0xFF6A11CB).withOpacity(0.5),
                    const Color(0xFF2575FC).withOpacity(0.5),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            
            // Mobile footer columns - 2 columns layout
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _FooterColumn(
                        title: 'AI SOLUTIONS',
                        items: [
                          'Machine Learning',
                          'Computer Vision',
                          'Natural Language',
                          'Process Automation',
                        ],
                      ),
                      SizedBox(height: 30),
                      _FooterColumn(
                        title: 'COMPANY',
                        items: [
                          'About Us',
                          'Our Team',
                          'Careers',
                          'Case Studies',
                          'Contact',
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    children: [
                      _FooterColumn(
                        title: 'INDUSTRIES',
                        items: [
                          'Healthcare',
                          'Finance',
                          'Manufacturing',
                          'Technology',
                          'Education',
                        ],
                      ),
                      SizedBox(height: 30),
                      _FooterColumn(
                        title: 'RESOURCES',
                        items: [
                          'Documentation',
                          'API Reference',
                          'Tutorials',
                          'Community',
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            // Social links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialIcon(Icons.link, 'LinkedIn'),
                const SizedBox(width: 20),
                _SocialIcon(Icons.code, 'GitHub'),
                const SizedBox(width: 20),
                _SocialIcon(Icons.article, 'Medium'),
                const SizedBox(width: 20),
                _SocialIcon(Icons.alternate_email, 'Twitter'),
              ],
            ),
            const SizedBox(height: 30),
            
            // Copyright
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                '© 2025 NexGAI. All rights reserved.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrustIndicator extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TrustIndicator({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6A11CB).withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const _FooterColumn({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
          ).createShader(bounds),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            onTap: () {},
            child: Text(
              item,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String platform;

  const _SocialIcon(this.icon, this.platform);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.1),
              Colors.white.withOpacity(0.05),
            ],
          ),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white.withOpacity(0.8),
          size: 18,
        ),
      ),
    );
  }
}