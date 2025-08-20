import 'package:flutter/material.dart';
import 'package:nexgai_website/responsive/responsive.dart';
import 'package:nexgai_website/utills/common_widget.dart';
import 'package:nexgai_website/utills/constants.dart';
import 'package:nexgai_website/utills/utils.dart';
import 'dart:math' as math;
import 'dart:ui';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<StatefulWidget> createState() {
    return HeroSectionState();
  }
}

class HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _glowController;
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _floatController = AnimationController(
      duration: const Duration(seconds: 35),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _glowController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF000000), // Pure black
            Color(0xFF0F0C29), // Deep navy
            Color(0xFF1A0B3D), // Dark purple
            Color(0xFF2D1B69), // Medium purple
            Color(0xFF0F0C29), // Back to deep navy
            Color(0xFF000000), // Pure black
          ],
          stops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          // Enhanced animated background particles/glow effects
          ...List.generate(8, (index) => 
            AnimatedBuilder(
              animation: _glowController,
              builder: (context, child) {
                final offset = index * 0.3;
                final animValue = (_glowController.value + offset) % 1.0;
                return Positioned(
                  left: (index * 180.0) + (animValue * 100) - 50,
                  top: (index * 80.0) + (animValue * 60) - 30,
                  child: Container(
                    width: 120 + (index * 15),
                    height: 120 + (index * 15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFF00D4AA).withOpacity(0.15 + (animValue * 0.1)), // Teal
                          const Color(0xFF6C63FF).withOpacity(0.1 + (animValue * 0.05)), // Purple
                          const Color(0xFF00D4AA).withOpacity(0.08 + (animValue * 0.03)), // Teal
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.3, 0.6, 1.0],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Additional larger glow orbs
          ...List.generate(3, (index) => 
            AnimatedBuilder(
              animation: _floatController,
              builder: (context, child) {
                final offset = index * 0.5;
                final animValue = (_floatController.value + offset) % 1.0;
                return Positioned(
                  right: (index * 250.0) + (animValue * 80),
                  top: (index * 200.0) + (animValue * 40),
                  child: Container(
                    width: 300 + (index * 50),
                    height: 300 + (index * 50),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          const Color(0xFF00D4AA).withOpacity(0.08),
                          const Color(0xFF6C63FF).withOpacity(0.05),
                          const Color(0xFF00D4AA).withOpacity(0.03),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.4, 0.7, 1.0],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              if (Responsive.isDesktop(context)) 
                HeroSectionWebView(
                  glowController: _glowController,
                  floatController: _floatController,
                ),
              if (!Responsive.isDesktop(context)) 
                HeroSectionMobView(
                  glowController: _glowController,
                  floatController: _floatController,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeroSectionMobView extends StatelessWidget {
  final AnimationController glowController;
  final AnimationController floatController;

  const HeroSectionMobView({
    super.key,
    required this.glowController,
    required this.floatController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
          child: heroSectionText(context),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TechStackGrid(
            glowController: glowController,
            floatController: floatController,
            isMobile: true,
          ),
        ),
      ],
    );
  }
}

class HeroSectionWebView extends StatelessWidget {
  final AnimationController glowController;
  final AnimationController floatController;

  const HeroSectionWebView({
    super.key,
    required this.glowController,
    required this.floatController,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: 80,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              child: heroSectionText(context),
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            flex: 4,
            child: TechStackGrid(
              glowController: glowController,
              floatController: floatController,
              isMobile: false,
            ),
          ),
        ],
      ),
    );
  }
}

class TechStackGrid extends StatelessWidget {
  final AnimationController glowController;
  final AnimationController floatController;
  final bool isMobile;

  const TechStackGrid({
    super.key,
    required this.glowController,
    required this.floatController,
    required this.isMobile,
  });

  final List<Map<String, dynamic>> techStack = const [
    {'name': 'OpenAI', 'icon': '🤖', 'color': Color(0xFF00D4AA)},
    {'name': 'LangChain', 'icon': '🔗', 'color': Color(0xFF6C63FF)},
    {'name': 'React.js', 'icon': '⚛️', 'color': Color(0xFF61DAFB)},
    {'name': 'Next.js', 'icon': '▲', 'color': Color(0xFF000000)},
    {'name': 'Django', 'icon': '🐍', 'color': Color(0xFF092E20)},
    {'name': 'FastAPI', 'icon': '⚡', 'color': Color(0xFF009688)},
    {'name': 'AWS', 'icon': '☁️', 'color': Color(0xFFFF9900)},
    {'name': 'Flutter', 'icon': '📱', 'color': Color(0xFF02569B)},
    {'name': 'PostgreSQL', 'icon': '🐘', 'color': Color(0xFF336791)},
    {'name': 'Docker', 'icon': '🐳', 'color': Color(0xFF2496ED)},
    {'name': 'Pinecone', 'icon': '📊', 'color': Color(0xFF9C27B0)},
    {'name': 'Hugging Face', 'icon': '🤗', 'color': Color(0xFFFFD21E)},
    {'name': 'Node.js', 'icon': '🟢', 'color': Color(0xFF68A063)},
    {'name': 'Appian', 'icon': '⚙️', 'color': Color(0xFF4A90E2)},
    {'name': 'Salesforce', 'icon': '☁️', 'color': Color(0xFF00A1E0)},
    {'name': 'GitHub', 'icon': '🐙', 'color': Color(0xFF333333)},
  ];

  @override
  Widget build(BuildContext context) {
    return isMobile ? _buildMobileCarousel() : _build3DSpiralCarousel();
  }

  Widget _buildMobileCarousel() {
    return SizedBox(
      height: 200,
      child: AnimatedBuilder(
        animation: floatController,
        builder: (context, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: techStack.length,
            itemBuilder: (context, index) {
              final tech = techStack[index % techStack.length];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: _buildTechCard(tech, index, isMobile: true),
              );
            },
          );
        },
      ),
    );
  }

  Widget _build3DSpiralCarousel() {
    return Container(
      height: 600,
      width: 500,
      child: AnimatedBuilder(
        animation: floatController,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Background spiral lines
              CustomPaint(
                size: const Size(500, 600),
                painter: SpiralBackgroundPainter(
                  animation: floatController.value,
                ),
              ),
              // Tech cards in 3D spiral formation
              ...List.generate(techStack.length, (index) {
                return _build3DTechCard(index);
              }),
              // Center glow effect
              Positioned(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF00D4AA).withOpacity(0.3),
                        const Color(0xFF6C63FF).withOpacity(0.15),
                        const Color(0xFF00D4AA).withOpacity(0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _build3DTechCard(int index) {
    return AnimatedBuilder(
      animation: Listenable.merge([floatController, glowController]),
      builder: (context, child) {
        // 3D spiral calculations
        final double spiralRadius = 180.0;
        final double spiralHeight = 500.0;
        final double spiralTurns = 3.0;
        
        // Animation progress with continuous rotation
        final double animationProgress = (floatController.value + (index / techStack.length)) % 1.0;
        final double angle = animationProgress * 2 * math.pi * spiralTurns;
        final double heightProgress = animationProgress;
        
        // 3D positioning
        final double x = spiralRadius * math.cos(angle);
        final double z = spiralRadius * math.sin(angle); // Depth
        final double y = (heightProgress * spiralHeight) - (spiralHeight / 2);
        
        // Perspective projection
        final double perspective = 800.0;
        final double projectedX = (x * perspective) / (perspective + z + 200);
        final double projectedY = (y * perspective) / (perspective + z + 200);
        final double scale = (perspective / (perspective + z + 200)).clamp(0.3, 1.2);
        
        // Opacity based on depth (far items are more transparent)
        final double opacity = (scale * 0.8 + 0.2).clamp(0.2, 1.0);
        
        return Positioned(
          left: 250 + projectedX - (40 * scale),
          top: 300 + projectedY - (40 * scale),
          child: Transform.scale(
            scale: scale,
            child: Opacity(
              opacity: opacity,
              child: _buildTechCard(
                techStack[index],
                index,
                isMobile: false,
                is3D: true,
                depth: z,
                scale: scale,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTechCard(
    Map<String, dynamic> tech,
    int index, {
    required bool isMobile,
    bool is3D = false,
    double depth = 0,
    double scale = 1.0,
  }) {
    final cardSize = isMobile ? 120.0 : (is3D ? 90.0 : 140.0);
    final fontSize = isMobile ? 28.0 : (is3D ? 24.0 : 32.0);
    final textSize = isMobile ? 10.0 : (is3D ? 9.0 : 12.0);

    return AnimatedBuilder(
      animation: glowController,
      builder: (context, child) {
        final glowIntensity = 0.3 + (glowController.value * 0.7);
        
        // Enhanced glow for items closer to viewer in 3D
        final depthGlow = is3D ? math.max(0.5, 2.0 - (depth.abs() / 100.0)) : 1.0;
        final scaleGlow = is3D ? scale : 1.0;
        
        return Container(
          width: cardSize,
          height: cardSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(is3D ? 22 : 24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.25),
                Colors.white.withOpacity(0.12),
                tech['color'].withOpacity(0.15),
                Colors.black.withOpacity(0.2),
              ],
              stops: const [0.0, 0.3, 0.7, 1.0],
            ),
            border: Border.all(
              color: tech['color'].withOpacity(0.5 + (glowController.value * 0.3)),
              width: is3D ? 1.2 : 1.5,
            ),
            boxShadow: [
              // Main colored glow
              BoxShadow(
                color: tech['color'].withOpacity(glowIntensity * 0.5 * depthGlow * scaleGlow),
                blurRadius: (25 + (glowController.value * 15)) * depthGlow * scaleGlow,
                spreadRadius: 3,
                offset: Offset(0, is3D ? 6 : 8),
              ),
              // Secondary teal glow
              BoxShadow(
                color: const Color(0xFF00D4AA).withOpacity(glowIntensity * 0.3 * depthGlow),
                blurRadius: (35 + (glowController.value * 20)) * depthGlow,
                spreadRadius: 1,
                offset: Offset(0, is3D ? 3 : 4),
              ),
              // Tertiary purple glow
              BoxShadow(
                color: const Color(0xFF6C63FF).withOpacity(glowIntensity * 0.2 * depthGlow),
                blurRadius: (45 + (glowController.value * 25)) * depthGlow,
                spreadRadius: 0,
                offset: Offset(0, is3D ? 2 : 3),
              ),
              // Inner highlight
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: -2,
                offset: const Offset(-2, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(is3D ? 22 : 24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.1),
                      tech['color'].withOpacity(0.1),
                      Colors.black.withOpacity(0.15),
                    ],
                    stops: const [0.0, 0.3, 0.7, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon with enhanced background
                    Container(
                      padding: EdgeInsets.all(is3D ? 8 : 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            tech['color'].withOpacity(0.4),
                            tech['color'].withOpacity(0.2),
                            tech['color'].withOpacity(0.05),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.3, 0.7, 1.0],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: tech['color'].withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Text(
                        tech['icon'],
                        style: TextStyle(
                          fontSize: fontSize,
                          shadows: [
                            Shadow(
                              color: tech['color'].withOpacity(0.5),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!is3D || scale > 0.6) ...[
                      SizedBox(height: is3D ? 4 : 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          tech['name'],
                          textAlign: TextAlign.center,
                          maxLines: is3D ? 1 : 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'CircularStd-Book',
                            fontSize: textSize,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withOpacity(0.95),
                            letterSpacing: 0.4,
                            shadows: [
                              Shadow(
                                color: tech['color'].withOpacity(0.3),
                                blurRadius: 8,
                              ),
                              const Shadow(
                                color: Colors.black54,
                                blurRadius: 4,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SpiralBackgroundPainter extends CustomPainter {
  final double animation;

  SpiralBackgroundPainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final center = Offset(size.width / 2, size.height / 2);

    // Draw multiple spiral lines with different colors and phases
    final spiralConfigs = [
      {'color': const Color(0xFF00D4AA), 'opacity': 0.4, 'phase': 0.0},
      {'color': const Color(0xFF6C63FF), 'opacity': 0.3, 'phase': math.pi / 3},
      {'color': const Color(0xFF00D4AA), 'opacity': 0.35, 'phase': 2 * math.pi / 3},
    ];

    for (int spiralIndex = 0; spiralIndex < spiralConfigs.length; spiralIndex++) {
      final config = spiralConfigs[spiralIndex];
      paint.color = (config['color'] as Color).withOpacity(config['opacity'] as double);
      
      final path = Path();
      bool isFirst = true;

      for (double t = 0; t <= 6 * math.pi; t += 0.05) {
        final radius = 60.0 + (t * 12) + (spiralIndex * 8);
        final angle = t + (animation * 2 * math.pi) + (config['phase'] as double);
        final x = center.dx + radius * math.cos(angle) * 0.8;
        final y = center.dy + radius * math.sin(angle) * 0.4 + (t * 6) - (3 * math.pi * 6);

        if (y > -50 && y < size.height + 50 && x > -50 && x < size.width + 50) {
          if (isFirst) {
            path.moveTo(x, y);
            isFirst = false;
          } else {
            path.lineTo(x, y);
          }
        }
      }

      canvas.drawPath(path, paint);
    }

    // Draw connecting orbital rings
    paint
      ..color = const Color(0xFF00D4AA).withOpacity(0.15)
      ..strokeWidth = 0.8;

    for (double radius = 80; radius <= 220; radius += 35) {
      final ringPath = Path();
      for (double angle = 0; angle <= 2 * math.pi; angle += 0.1) {
        final rotatedAngle = angle + (animation * math.pi / 2);
        final x = center.dx + radius * math.cos(rotatedAngle) * 0.8;
        final y = center.dy + radius * math.sin(rotatedAngle) * 0.4;
        
        if (angle == 0) {
          ringPath.moveTo(x, y);
        } else {
          ringPath.lineTo(x, y);
        }
      }
      ringPath.close();
      canvas.drawPath(ringPath, paint);
    }

    // Draw radial connection lines
    paint
      ..color = const Color(0xFF6C63FF).withOpacity(0.12)
      ..strokeWidth = 0.6;

    for (double angle = 0; angle < 2 * math.pi; angle += math.pi / 8) {
      final rotatedAngle = angle + (animation * math.pi / 3);
      final startRadius = 70.0;
      final endRadius = 230.0;
      
      final startX = center.dx + startRadius * math.cos(rotatedAngle) * 0.8;
      final startY = center.dy + startRadius * math.sin(rotatedAngle) * 0.4;
      final endX = center.dx + endRadius * math.cos(rotatedAngle) * 0.8;
      final endY = center.dy + endRadius * math.sin(rotatedAngle) * 0.4;

      canvas.drawLine(
        Offset(startX, startY),
        Offset(endX, endY),
        paint,
      );
    }

    // Add particle dots along the spiral
    paint
      ..style = PaintingStyle.fill
      ..color = const Color(0xFFFFFFFF).withOpacity(0.6);

    for (double t = 0; t <= 4 * math.pi; t += math.pi / 4) {
      final radius = 90.0 + (t * 15);
      final angle = t + (animation * 2 * math.pi);
      final x = center.dx + radius * math.cos(angle) * 0.8;
      final y = center.dy + radius * math.sin(angle) * 0.4 + (t * 8) - (2 * math.pi * 8);

      if (y > 0 && y < size.height && x > 0 && x < size.width) {
        canvas.drawCircle(Offset(x, y), 2.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Widget heroSectionText(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  final isMobile = width <= 600;
  
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Enhanced gradient title with NexG.ai branding
      ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Color(0xFFFFFFFF), // Pure white
            Color(0xFF00D4AA), // Teal
            Color(0xFF6C63FF), // Purple
            Color(0xFF00D4AA), // Teal
            Color(0xFFFFFFFF), // Pure white
          ],
          stops: [0.0, 0.2, 0.5, 0.8, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds),
        child: Text(
          'NexG.ai – Shaping the Next\nGeneration of AI-First Innovation',
          style: TextStyle(
            fontFamily: 'CircularStd-Book',
            fontSize: isMobile ? 28 : 52,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 1.1,
            letterSpacing: isMobile ? 0.5 : 1.0,
          ),
        ),
      ),
      const SizedBox(height: 24),
      
      // Enhanced description with better styling
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.08),
              Colors.white.withOpacity(0.04),
              Colors.black.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: const Color(0xFF00D4AA).withOpacity(0.2),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Text(
          'Empowering youth, empowering enterprises. From startups to global organizations, '
          'we deliver AI-powered digital solutions with speed, precision, and scalability. '
          'Where innovation meets execution in the AI-first era.',
          style: TextStyle(
            fontFamily: 'CircularStd-Book',
            fontSize: isMobile ? 16 : 20,
            color: Colors.white.withOpacity(0.9),
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      const SizedBox(height: 35),
      
      // Enhanced AI Services chips with better styling
      Wrap(
        spacing: 15,
        runSpacing: 12,
        children: [
          _buildServiceChip('🧠 AI-First Products', isMobile),
          _buildServiceChip('⚡ Lightning Speed POCs', isMobile),
          _buildServiceChip('🚀 Youth + Expert Teams', isMobile),
          _buildServiceChip('🔬 NexG.ai Labs', isMobile),
        ],
      ),
      const SizedBox(height: 45),
      
      // Enhanced buttons with better styling and effects
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF00D4AA),
                  Color(0xFF6C63FF),
                  Color(0xFF00D4AA),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00D4AA).withOpacity(0.5),
                  blurRadius: 25,
                  offset: const Offset(0, 12),
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: const Color(0xFF6C63FF).withOpacity(0.3),
                  blurRadius: 35,
                  offset: const Offset(0, 8),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 28 : 40,
                  vertical: isMobile ? 16 : 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Join AI Revolution',
                    style: TextStyle(
                      fontFamily: 'CircularStd-Book',
                      fontSize: isMobile ? 14 : 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: isMobile ? 25 : 35),
          
          // Enhanced secondary button
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.05),
                ],
              ),
              border: Border.all(
                color: const Color(0xFF00D4AA).withOpacity(0.4),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00D4AA).withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: TextButton.icon(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 28,
                  vertical: isMobile ? 16 : 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D4AA), Color(0xFF6C63FF)],
                  ),
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: isMobile ? 16 : 20,
                ),
              ),
              label: Text(
                'Watch Demo',
                style: TextStyle(
                  fontFamily: 'CircularStd-Book',
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.white.withOpacity(0.95),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildServiceChip(String text, bool isMobile) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 12 : 16,
      vertical: isMobile ? 6 : 8,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
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
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF00D4AA).withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'CircularStd-Book',
        fontSize: isMobile ? 11 : 13,
        color: Colors.white.withOpacity(0.9),
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}