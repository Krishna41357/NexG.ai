import 'package:flutter/material.dart';
import 'package:nexgai_website/utills/utils.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (width > 1360) const AboutUsWeb(),
        if (width <= 1360) const AboutUsMobile(),
      ],
    );
  }
}

//
// ---------------------- WEB VERSION ----------------------
//
class AboutUsWeb extends StatelessWidget {
  const AboutUsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Aboutus1(), Aboutus2()],
    );
  }
}

class Aboutus1 extends StatelessWidget {
  const Aboutus1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF000000), // Pure black
                Color(0xFF0F0C29), // Deep navy
                Color(0xFF1A0B3D), // Dark purple
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 600,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1050),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.05),
                    const Color(0xFF00D4AA).withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF00D4AA).withOpacity(0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00D4AA).withOpacity(0.2),
                    blurRadius: 30,
                    offset: const Offset(0, 8),
                  ),
                  BoxShadow(
                    color: const Color(0xFF6C63FF).withOpacity(0.15),
                    blurRadius: 40,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF00D4AA).withOpacity(0.2),
                          const Color(0xFF6C63FF).withOpacity(0.15),
                          Colors.black.withOpacity(0.2),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF00D4AA).withOpacity(0.3),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.psychology_alt,
                        size: 150,
                        color: Color(0xFF00D4AA),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Empowering the AI-First Era',
                          style: TextStyle(
                            color: const Color(0xFF00D4AA).withOpacity(0.9),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xFFFFFFFF),
                              Color(0xFF00D4AA),
                              Color(0xFF6C63FF),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: const Text(
                            "Who We Are at NexG.ai",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'At NexG.ai, we are an early-stage, tech-driven startup with a bold mission: '
                          'To empower the youth of today to thrive in the AI-driven era and bring AI-first '
                          'product innovation to enterprises across the world. We combine the fresh perspective '
                          'of exceptional interns from top colleges with the expertise of seasoned consultants.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 2,
                          width: 100,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF00D4AA), Color(0xFF6C63FF)],
                            ),
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            InfoCard(number: '100', label2: '%', label: 'AI-First Solutions'),
                            SizedBox(width: 30),
                            InfoCard(number: '24', label2: 'x7', label: 'Support & Innovation'),
                            SizedBox(width: 30),
                            InfoCard(number: '∞', label2: '', label: 'Growth Potential'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Aboutus2 extends StatelessWidget {
  const Aboutus2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF000000),
            Color(0xFF0F0C29),
            Color(0xFF000000),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(140, 80, 140, 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [ourServicesText()]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildServiceCard(
                    title: 'Web & App Development',
                    iconData: Icons.web,
                    description: 'Scalable, modern, and user-friendly platforms built with cutting-edge tech.',
                    color: const Color(0xFF61DAFB),
                  ),
                  _buildServiceCard(
                    title: 'AI & Machine Learning',
                    iconData: Icons.psychology_alt,
                    description: 'Custom AI models, GenAI, Agentic solutions, RAG pipelines, CV, NLP.',
                    color: const Color(0xFF00D4AA),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildServiceCard(
                    title: 'Cloud & DevOps',
                    iconData: Icons.cloud_queue,
                    description: 'Secure, scalable, and optimized deployments on AWS, Azure, GCP.',
                    color: const Color(0xFFFF9900),
                  ),
                  _buildServiceCard(
                    title: 'Low-Code Tools',
                    iconData: Icons.build_circle,
                    description: 'Appian, Salesforce & more for faster digital transformation.',
                    color: const Color(0xFF4A90E2),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildServiceCard(
                    title: 'Consulting & Strategy',
                    iconData: Icons.lightbulb_outline,
                    description: 'From MVPs to enterprise-grade systems with AI-first approach.',
                    color: const Color(0xFF6C63FF),
                  ),
                  _buildServiceCard(
                    title: 'NexG.ai Labs',
                    iconData: Icons.science,
                    description: 'Where Applied AI Agentic Solutions meet real-world problems.',
                    color: const Color(0xFFB721FF),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

//
// ---------------------- MOBILE VERSION ----------------------
//
class AboutUsMobile extends StatelessWidget {
  const AboutUsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF000000),
            Color(0xFF0F0C29),
            Color(0xFF1A0B3D),
            Color(0xFF000000),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          // Image + Intro stacked
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF00D4AA).withOpacity(0.2),
                        const Color(0xFF6C63FF).withOpacity(0.15),
                        Colors.black.withOpacity(0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF00D4AA).withOpacity(0.3),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.psychology_alt,
                      size: 100,
                      color: Color(0xFF00D4AA),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Empowering the AI-First Era',
                  style: TextStyle(
                    color: const Color(0xFF00D4AA).withOpacity(0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFF00D4AA),
                      Color(0xFF6C63FF),
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    "Who We Are at NexG.ai",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'We are an early-stage, tech-driven startup empowering youth and enterprises '
                  'with AI-first solutions. Our exceptional interns from top colleges work with '
                  'seasoned consultants to deliver industry-best practices.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 15,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoCard(number: '100', label2: '%', label: 'AI-First'),
                    InfoCard(number: '24', label2: 'x7', label: 'Support'),
                    InfoCard(number: '∞', label2: '', label: 'Growth'),
                  ],
                ),
              ],
            ),
          ),

          // Services stacked
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ourServicesText(),
                const SizedBox(height: 24),
                _buildServiceCard(
                  title: 'Web & App Development',
                  iconData: Icons.web,
                  description: 'Scalable, modern, and user-friendly platforms built with cutting-edge tech.',
                  color: const Color(0xFF61DAFB),
                ),
                _buildServiceCard(
                  title: 'AI & Machine Learning',
                  iconData: Icons.psychology_alt,
                  description: 'Custom AI models, GenAI, Agentic solutions, RAG pipelines, CV, NLP.',
                  color: const Color(0xFF00D4AA),
                ),
                _buildServiceCard(
                  title: 'Cloud & DevOps',
                  iconData: Icons.cloud_queue,
                  description: 'Secure, scalable, and optimized deployments on AWS, Azure, GCP.',
                  color: const Color(0xFFFF9900),
                ),
                _buildServiceCard(
                  title: 'Low-Code Tools',
                  iconData: Icons.build_circle,
                  description: 'Appian, Salesforce & more for faster digital transformation.',
                  color: const Color(0xFF4A90E2),
                ),
                _buildServiceCard(
                  title: 'Consulting & Strategy',
                  iconData: Icons.lightbulb_outline,
                  description: 'From MVPs to enterprise-grade systems with AI-first approach.',
                  color: const Color(0xFF6C63FF),
                ),
                _buildServiceCard(
                  title: 'NexG.ai Labs',
                  iconData: Icons.science,
                  description: 'Where Applied AI Agentic Solutions meet real-world problems.',
                  color: const Color(0xFFB721FF),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// ---------------------- REUSABLE WIDGETS ----------------------
//
Widget ourServicesText() {
  return Container(
    constraints: const BoxConstraints(maxWidth: 500),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFF00D4AA),
              Color(0xFF6C63FF),
            ],
          ).createShader(bounds),
          child: const Text(
            'Our Services',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'We help businesses reimagine possibilities with AI-first solutions across multiple domains.',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(0.9),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: 200,
          width: 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF00D4AA).withOpacity(0.15),
                const Color(0xFF6C63FF).withOpacity(0.1),
                Colors.black.withOpacity(0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF00D4AA).withOpacity(0.3),
            ),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.auto_awesome,
                  size: 80,
                  color: Color(0xFF00D4AA),
                ),
                SizedBox(height: 16),
                Text(
                  'AI-First Innovation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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

Widget _buildServiceCard({
  required String title, 
  required IconData iconData, 
  required String description,
  required Color color,
}) {
  return Container(
    width: 280,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.1),
              Colors.white.withOpacity(0.05),
              color.withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    color.withOpacity(0.3),
                    color.withOpacity(0.1),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(iconData, size: 40, color: color),
            ),
            const SizedBox(height: 16),
            Text(
              title, 
              style: TextStyle(
                fontWeight: FontWeight.w700, 
                fontSize: 18, 
                color: Colors.white,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              description, 
              style: TextStyle(
                fontSize: 14, 
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
              ), 
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

class InfoCard extends StatelessWidget {
  final String number;
  final String label;
  final String label2;

  const InfoCard({super.key, required this.number, required this.label, required this.label2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF00D4AA), Color(0xFF6C63FF)],
              ).createShader(bounds),
              child: Text(
                number, 
                style: const TextStyle(
                  color: Colors.white, 
                  fontSize: 24, 
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF00D4AA), Color(0xFF6C63FF)],
              ).createShader(bounds),
              child: Text(
                label2, 
                style: const TextStyle(
                  color: Colors.white, 
                  fontSize: 18, 
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label, 
          style: TextStyle(
            color: Colors.white.withOpacity(0.8), 
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}