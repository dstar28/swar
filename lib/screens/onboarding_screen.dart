import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int step = 0;

  final List<_OnboardingData> screens = const [
    _OnboardingData(
      title: 'Discover Sanskrit',
      deva: 'संस्कृत परिचयः',
      body:
          'Explore the vowels and consonant families exactly as they are classified in traditional Sanskrit grammar.',
      type: OnboardingVisual.mandala,
    ),
    _OnboardingData(
      title: 'Perfect Your Pronunciation',
      deva: 'शुद्ध उच्चारणम्',
      body:
          'Record yourself speaking each sound and compare it with traditional articulation, sound by sound.',
      type: OnboardingVisual.microphone,
    ),
    _OnboardingData(
      title: 'Learn With AI',
      deva: 'कृत्रिम बुद्धिः',
      body:
          'AI analyses your articulation and turns it into a clear score with specific, teachable corrections.',
      type: OnboardingVisual.ai,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final current = screens[step];
    final last = step == screens.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF7EF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Column(
                children: [
                  // ─────────────────────────────
                  // TOP BAR
                  // ─────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SwarLogo(),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ─────────────────────────────
                  // MAIN CONTENT
                  // ─────────────────────────────
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _buildVisual(current),
                          ),
                        ),

                        const Separator(),

                        const SizedBox(height: 24),

                        Text(
                          current.deva,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF354A82),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 3),

                        Text(
                          current.title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4D4033),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          current.body,
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.55,
                            color: Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ─────────────────────────
                        // THREE STEP MESSAGE
                        // ─────────────────────────
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0x18C79B45),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: const Color(0x66C79B45)),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'श्रवणम् → अभ्यासः → सिद्धिः',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF4D4033),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Listen → Practice → Master',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ─────────────────────────────
                  // PROGRESS INDICATORS
                  // ─────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(screens.length, (index) {
                      final selected = index == step;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: selected ? 24 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFFE7A13B)
                              : const Color(0xFFDAD5CC),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 20),

                  // ─────────────────────────────
                  // BUTTONS
                  // ─────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        if (last) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        } else {
                          setState(() {
                            step++;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE7A13B),
                        foregroundColor: const Color(0xFF332719),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text(
                        last ? 'Begin Your Journey' : 'Continue',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  if (step > 0) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            step--;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF4D4033),
                          side: const BorderSide(color: Color(0xFFE2D9C8)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Back',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVisual(_OnboardingData data) {
    switch (data.type) {
      case OnboardingVisual.mandala:
        return const MandalaVisual(key: ValueKey('mandala'));

      case OnboardingVisual.microphone:
        return const MicrophoneVisual(key: ValueKey('microphone'));

      case OnboardingVisual.ai:
        return const AiVisual(key: ValueKey('ai'));
    }
  }
}

// ═══════════════════════════════════════════
// DATA
// ═══════════════════════════════════════════

enum OnboardingVisual { mandala, microphone, ai }

class _OnboardingData {
  final String title;
  final String deva;
  final String body;
  final OnboardingVisual type;

  const _OnboardingData({
    required this.title,
    required this.deva,
    required this.body,
    required this.type,
  });
}

// ═══════════════════════════════════════════
// SCREEN 1 — MANDALA
// ═══════════════════════════════════════════

class MandalaVisual extends StatelessWidget {
  const MandalaVisual({super.key});

  static const letters = ['अ', 'आ', 'इ', 'क', 'ख', 'ट', 'त', 'प'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 224,
      child: Center(
        child: SizedBox(
          width: 230,
          height: 230,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Mandala(),

              for (int i = 0; i < letters.length; i++)
                Transform.rotate(
                  angle: i * math.pi / 4,
                  child: Transform.translate(
                    offset: const Offset(0, -92),
                    child: Transform.rotate(
                      angle: -i * math.pi / 4,
                      child: Text(
                        letters[i],
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF354A82),
                        ),
                      ),
                    ),
                  ),
                ),

              const Text(
                'स्वर',
                style: TextStyle(fontSize: 48, color: Color(0xFF4D4033)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════
// SCREEN 2 — MICROPHONE
// ═══════════════════════════════════════════

class MicrophoneVisual extends StatelessWidget {
  const MicrophoneVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 224,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFE7A13B), Color(0xFFD88925)],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0x55E7A13B),
                      width: 8,
                    ),
                  ),
                ),
                const Icon(Icons.mic_rounded, size: 38, color: Colors.white),
              ],
            ),
          ),

          const SizedBox(height: 18),

          const Waveform(active: true),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
// SCREEN 3 — AI
// ═══════════════════════════════════════════

class AiVisual extends StatelessWidget {
  const AiVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 224,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.auto_awesome, size: 32, color: Color(0xFFC79B45)),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ट',
                style: TextStyle(fontSize: 40, color: Color(0xFF4D4033)),
              ),

              const SizedBox(width: 18),

              Text(
                '→',
                style: TextStyle(fontSize: 22, color: Colors.grey.shade500),
              ),

              const SizedBox(width: 18),

              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF354A82), width: 4),
                ),
                child: const Center(
                  child: Text(
                    '87',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4D4033),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            'Instant pronunciation score',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════
// MANDALA
// ═══════════════════════════════════════════

class Mandala extends StatelessWidget {
  const Mandala({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: MandalaPainter(), size: const Size(208, 208));
  }
}

class MandalaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = const Color(0x4DC79B45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;

    // Circles
    for (final radius in [30.0, 52.0, 76.0, 94.0]) {
      canvas.drawCircle(center, radius, paint);
    }

    // 12 petals
    for (int i = 0; i < 12; i++) {
      canvas.save();

      canvas.translate(center.dx, center.dy);

      canvas.rotate(i * 2 * math.pi / 12);

      final path = Path();

      path.moveTo(0, -94);

      path.cubicTo(12, -72, 12, -48, 0, -24);

      path.cubicTo(-12, -48, -12, -72, 0, -94);

      canvas.drawPath(path, paint);

      canvas.drawLine(const Offset(0, -24), const Offset(0, -6), paint);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// ═══════════════════════════════════════════
// WAVEFORM
// ═══════════════════════════════════════════

class Waveform extends StatelessWidget {
  final bool active;

  const Waveform({super.key, this.active = false});

  @override
  Widget build(BuildContext context) {
    final heights = List.generate(
      28,
      (i) => active ? 20 + math.sin((i + 1) * 1.7).abs() * 40 : 10.0,
    );

    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: heights.map((height) {
          return Container(
            width: 6,
            height: height,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: active ? const Color(0xFFE7A13B) : const Color(0xFFDAD5CC),
              borderRadius: BorderRadius.circular(10),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ═══════════════════════════════════════════
// SEPARATOR
// ═══════════════════════════════════════════

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: const Color(0x66C79B45))),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '◇',
            style: TextStyle(color: Color(0xFFC79B45), fontSize: 14),
          ),
        ),

        Expanded(child: Container(height: 1, color: const Color(0x66C79B45))),
      ],
    );
  }
}

// ═══════════════════════════════════════════
// SWAR LOGO
// ═══════════════════════════════════════════

class SwarLogo extends StatelessWidget {
  const SwarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: CustomPaint(painter: SwarLogoPainter()),
    );
  }
}

class SwarLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final radius = size.width / 2;

    final bluePaint = Paint()..color = const Color(0xFF354A82);

    final goldPaint = Paint()
      ..color = const Color(0xFFE7A13B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius - 1, bluePaint);

    canvas.drawCircle(center, radius - 5, goldPaint);

    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'स्व',
        style: TextStyle(color: Color(0xFFE7A13B), fontSize: 14),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2 + 4,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
