import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const SwarApp());
}

class SwarApp extends StatelessWidget {
  const SwarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SWAR',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAF7EF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE6A23C),
          brightness: Brightness.light,
        ),
        fontFamily: 'sans',
      ),
      home: const WelcomeScreen(),
    );
  }
}

// ─────────────────────────────────────────────
// WELCOME SCREEN
// ─────────────────────────────────────────────

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showSplash = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 2200), () {
      if (mounted) {
        setState(() {
          showSplash = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSplash) {
      return const SwarSplash();
    }

    return const SwarLanding();
  }
}

// ─────────────────────────────────────────────
// SPLASH
// ─────────────────────────────────────────────

class SwarSplash extends StatelessWidget {
  const SwarSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFFAF7EF)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 260,
                height: 260,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      width: 250,
                      height: 250,
                      child: Mandala(color: Color(0x55C79B45)),
                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SwarLogo(size: 80),
                        const SizedBox(height: 16),

                        Text(
                          'स्वर',
                          style: TextStyle(
                            fontSize: 38,
                            color: const Color(0xFF4D4033),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          'SWAR',
                          style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 5,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'AI-Powered Sanskrit Pronunciation',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),

              const SizedBox(height: 8),

              const SizedBox(width: 220, child: Waveform()),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// LANDING PAGE
// ─────────────────────────────────────────────

class SwarLanding extends StatelessWidget {
  const SwarLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
                child: Row(
                  children: [
                    const SwarLogo(size: 40),

                    const SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SWAR',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 3,
                            color: Color(0xFF4D4033),
                          ),
                        ),
                        Text(
                          'शुद्ध उच्चारणम्',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    TextButton(
                      onPressed: () {
                        _showComingSoon(context);
                      },
                      child: const Text(
                        'Open app',
                        style: TextStyle(
                          color: Color(0xFF354A82),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const GoldDivider(),

              const SizedBox(height: 32),

              // Hero heading
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    const Text(
                      'शुद्ध उच्चारणम् — Powered by AI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFC79B45),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Master Sanskrit\nPronunciation with AI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        height: 1.15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4D4033),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      'Learn the science of Sanskrit sounds. '
                      'Practice traditional pronunciation. '
                      'Receive instant AI-powered feedback.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.55,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              // Hero image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      width: 340,
                      height: 340,
                      child: Mandala(color: Color(0x35C79B45)),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset(
                        'assets/swar-hero.jpg',
                        width: 320,
                        height: 320,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Sanskrit floating letters
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingLetter('अ'),
                  FloatingLetter('आ'),
                  FloatingLetter('इ'),
                  FloatingLetter('क'),
                  FloatingLetter('ख'),
                  FloatingLetter('ट'),
                  FloatingLetter('त'),
                  FloatingLetter('प'),
                ],
              ),

              const SizedBox(height: 36),

              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const OnboardingScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE7A13B),
                          foregroundColor: const Color(0xFF332719),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Start Learning',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {
                          _showComingSoon(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF4D4033),
                          side: const BorderSide(color: Color(0xFFE2D9C8)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Explore Sanskrit',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              const GoldDivider(),

              const SizedBox(height: 36),

              // Features
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    FeatureCard(
                      sanskrit: 'श्रवणम्',
                      title: 'Listen',
                      description:
                          'Hear each sound articulated in the traditional manner.',
                    ),
                    const SizedBox(height: 14),
                    FeatureCard(
                      sanskrit: 'अभ्यासः',
                      title: 'Practice',
                      description:
                          'Record your own recitation, letter by letter.',
                    ),
                    const SizedBox(height: 14),
                    FeatureCard(
                      sanskrit: 'सिद्धिः',
                      title: 'Master',
                      description:
                          'AI scores your articulation and shows what to correct.',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  static void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Navigation coming next 🚀')));
  }
}

// ─────────────────────────────────────────────
// FEATURE CARD
// ─────────────────────────────────────────────

class FeatureCard extends StatelessWidget {
  final String sanskrit;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.sanskrit,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE7DECD)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 18,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sanskrit,
            style: const TextStyle(fontSize: 21, color: Color(0xFF354A82)),
          ),

          const SizedBox(height: 3),

          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4D4033),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              height: 1.5,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// FLOATING LETTER
// ─────────────────────────────────────────────

class FloatingLetter extends StatelessWidget {
  final String letter;

  const FloatingLetter(this.letter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        letter,
        style: const TextStyle(fontSize: 18, color: Color(0xFF354A82)),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// SWAR LOGO
// ─────────────────────────────────────────────

class SwarLogo extends StatelessWidget {
  final double size;

  const SwarLogo({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: SwarLogoPainter()),
    );
  }
}

class SwarLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final blue = Paint()
      ..color = const Color(0xFF354A82)
      ..style = PaintingStyle.fill;

    final gold = Paint()
      ..color = const Color(0xFFE7A13B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;

    canvas.drawCircle(center, radius, blue);

    // Inner dotted-ish ring
    canvas.drawCircle(center, radius * 0.77, gold);

    final wave = Paint()
      ..color = const Color(0xFFE7A13B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    final path = Path();

    path.moveTo(size.width * .23, size.height * .5);
    path.cubicTo(
      size.width * .28,
      size.height * .35,
      size.width * .30,
      size.height * .65,
      size.width * .35,
      size.height * .5,
    );

    path.cubicTo(
      size.width * .40,
      size.height * .35,
      size.width * .42,
      size.height * .65,
      size.width * .47,
      size.height * .5,
    );

    canvas.drawPath(path, wave);

    final path2 = Path();

    path2.moveTo(size.width * .56, size.height * .46);
    path2.cubicTo(
      size.width * .61,
      size.height * .30,
      size.width * .63,
      size.height * .70,
      size.width * .68,
      size.height * .5,
    );

    path2.cubicTo(
      size.width * .73,
      size.height * .30,
      size.width * .76,
      size.height * .65,
      size.width * .81,
      size.height * .46,
    );

    canvas.drawPath(path2, wave);

    const text = TextSpan(
      text: 'स्व',
      style: TextStyle(
        color: Color(0xFFE7A13B),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );

    final painter = TextPainter(text: text, textDirection: TextDirection.ltr);

    painter.layout();

    painter.paint(
      canvas,
      Offset(center.dx - painter.width / 2, size.height * .54),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// ─────────────────────────────────────────────
// MANDALA
// ─────────────────────────────────────────────

class Mandala extends StatelessWidget {
  final Color color;

  const Mandala({super.key, this.color = const Color(0x30C79B45)});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: MandalaPainter(color));
  }
}

class MandalaPainter extends CustomPainter {
  final Color color;

  MandalaPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final radius = math.min(size.width, size.height) / 2;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    for (final r in [radius * .30, radius * .52, radius * .76, radius * .94]) {
      canvas.drawCircle(center, r, paint);
    }

    canvas.save();
    canvas.translate(center.dx, center.dy);

    for (int i = 0; i < 12; i++) {
      canvas.save();
      canvas.rotate(i * math.pi / 6);

      final path = Path();

      path.moveTo(0, -radius * .76);
      path.cubicTo(
        radius * .12,
        -radius * .54,
        radius * .12,
        -radius * .38,
        0,
        -radius * .24,
      );

      path.cubicTo(
        -radius * .12,
        -radius * .38,
        -radius * .12,
        -radius * .54,
        0,
        -radius * .76,
      );

      canvas.drawPath(path, paint);

      canvas.restore();
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// ─────────────────────────────────────────────
// WAVEFORM
// ─────────────────────────────────────────────

class Waveform extends StatelessWidget {
  const Waveform({super.key});

  @override
  Widget build(BuildContext context) {
    const heights = [
      0.25,
      0.45,
      0.70,
      0.40,
      0.85,
      0.55,
      0.75,
      0.35,
      0.60,
      0.90,
      0.45,
      0.70,
      0.35,
      0.60,
      0.85,
      0.40,
      0.65,
      0.30,
      0.75,
      0.50,
      0.90,
      0.45,
      0.65,
      0.35,
    ];

    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: heights.map((height) {
          return Container(
            width: 3,
            height: 45 * height,
            margin: const EdgeInsets.symmetric(horizontal: 1.5),
            decoration: BoxDecoration(
              color: const Color(0xFFE7A13B),
              borderRadius: BorderRadius.circular(10),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// DIVIDER
// ─────────────────────────────────────────────

class GoldDivider extends StatelessWidget {
  const GoldDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color(0x99C79B45),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '◇',
            style: TextStyle(color: Color(0xFFC79B45), fontSize: 14),
          ),
        ),

        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color(0x99C79B45),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
