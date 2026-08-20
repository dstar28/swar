import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'learn_screen.dart';
import 'practice_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const background = Color(0xFFFAF7EF);
  static const card = Color(0xFFFFFDF8);
  static const brown = Color(0xFF4D4033);
  static const blue = Color(0xFF354A82);
  static const gold = Color(0xFFC79B45);
  static const saffron = Color(0xFFE7A13B);
  static const terracotta = Color(0xFFC66A45);
  static const border = Color(0xFFE7DECD);

  final int streak = 7;
  final int completed = 3;
  final int total = 5;

  @override
  Widget build(BuildContext context) {
    final percentage = ((completed / total) * 100).round();

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ─────────────────────────────
                    // GREETING
                    // ─────────────────────────────
                    const Text(
                      'नमस्ते, Hasit 👋',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: brown,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Continue your Sanskrit journey.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // ─────────────────────────────
                    // AUSPICIOUS CARD
                    // ─────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: card,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0x66C79B45)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'शुभं भवतु',
                                  style: TextStyle(fontSize: 22, color: blue),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'May it be auspicious — a greeting for study',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF77716A),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            width: 58,
                            height: 58,
                            child: HomeMandala(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ─────────────────────────────
                    // DAILY STREAK HEADER
                    // ─────────────────────────────
                    const SectionHeader(
                      deva: 'दैनिक अभ्यासः',
                      english: 'Daily streak',
                    ),

                    const SizedBox(height: 10),

                    // ─────────────────────────────
                    // STREAK CARD
                    // ─────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: const Color(0x18E7A13B),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0x66E7A13B)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0x18C66A45),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                child: const Icon(
                                  Icons.local_fire_department_rounded,
                                  size: 30,
                                  color: terracotta,
                                ),
                              ),

                              const SizedBox(width: 12),

                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '7 Day Streak',
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600,
                                      color: brown,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Keep your अभ्यास going!',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF77716A),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 22),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _DayIndicator(day: 'M', active: true),
                              _DayIndicator(day: 'T', active: true),
                              _DayIndicator(day: 'W', active: true),
                              _DayIndicator(day: 'T', active: true),
                              _DayIndicator(day: 'F', active: true),
                              _DayIndicator(day: 'S', active: true),
                              _DayIndicator(day: 'S', active: true),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ─────────────────────────────
                    // TODAY'S PRACTICE
                    // ─────────────────────────────
                    const SectionHeader(
                      deva: 'अद्य अभ्यासः',
                      english: "Today's practice",
                    ),

                    const SizedBox(height: 10),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: card,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: border),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0D000000),
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TODAY'S FOCUS",
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),

                          const SizedBox(height: 6),

                          const Text(
                            'मूर्धन्य ध्वनियाँ',
                            style: TextStyle(fontSize: 25, color: brown),
                          ),

                          const SizedBox(height: 2),

                          Text(
                            'Retroflex sounds',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),

                          const SizedBox(height: 18),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$completed / $total exercises completed',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Text(
                                '$percentage%',
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: brown,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 7),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 8,
                              color: const Color(0xFFE6E0D6),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: completed / total,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFE7A13B),
                                        Color(0xFFD78828),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const PracticeScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.mic_rounded, size: 18),
                              label: const Text(
                                'Continue Practice',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: saffron,
                                foregroundColor: const Color(0xFF332719),
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ─────────────────────────────
                    // SEPARATOR
                    // ─────────────────────────────
                    const GoldSeparator(),

                    const SizedBox(height: 28),

                    // ─────────────────────────────
                    // QUICK LEARNING
                    // ─────────────────────────────
                    const SectionHeader(
                      deva: 'शीघ्र अध्ययनम्',
                      english: 'Quick learning',
                    ),

                    const SizedBox(height: 12),

                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.05,
                      children: [
                        QuickLearningCard(
                          icon: Icons.text_fields_rounded,
                          title: 'Learn Letters',
                          deva: 'अ आ इ ई…',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LearnScreen(),
                            ),
                          ),
                        ),
                        QuickLearningCard(
                          icon: Icons.menu_book_rounded,
                          title: 'Practice Words',
                          deva: 'संस्कृत शब्दाः',
                          onTap: () => _showMessage(
                            context,
                            'Practice Words coming next 🚀',
                          ),
                        ),
                        QuickLearningCard(
                          icon: Icons.description_outlined,
                          title: 'Practice Shlokas',
                          deva: 'श्लोक अभ्यासः',
                          onTap: () => _showMessage(
                            context,
                            'Practice Shlokas coming next 🚀',
                          ),
                        ),
                        QuickLearningCard(
                          icon: Icons.auto_awesome,
                          title: 'Pronunciation Test',
                          deva: 'AI Evaluation',
                          onTap: () => _showMessage(
                            context,
                            'Pronunciation Test coming next 🚀',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
            const _HomeNavigation(),
          ],
        ),
      ),
    );
  }

  static void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _HomeNavigation extends StatelessWidget {
  const _HomeNavigation();

  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.home_outlined, 'Home'),
      (Icons.menu_book_outlined, 'Learn'),
      (Icons.mic_none_outlined, 'Practice'),
      (Icons.bar_chart_outlined, 'Progress'),
      (Icons.person_outline, 'Profile'),
    ];

    return Container(
      height: 74,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFCF5),
        border: Border(top: BorderSide(color: HomeScreen.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.indexed.map((entry) {
          final selected = entry.$1 == 0;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () => _openDestination(context, entry.$1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 3,
                  ),
                  child: Icon(
                    entry.$2.$1,
                    size: 22,
                    color: selected ? HomeScreen.blue : const Color(0xFF776B5D),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                entry.$2.$2,
                style: TextStyle(
                  fontSize: 10,
                  color: selected ? HomeScreen.blue : const Color(0xFF776B5D),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  void _openDestination(BuildContext context, int index) {
    if (index == 0) return;
    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LearnScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PracticeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${index == 3 ? 'Progress' : 'Profile'} is coming soon',
          ),
        ),
      );
    }
  }
}

// ═══════════════════════════════════════════
// SECTION HEADER
// ═══════════════════════════════════════════

class SectionHeader extends StatelessWidget {
  final String deva;
  final String english;

  const SectionHeader({super.key, required this.deva, required this.english});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          deva,
          style: const TextStyle(fontSize: 18, color: HomeScreen.blue),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            english,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════
// DAY INDICATOR
// ═══════════════════════════════════════════

class _DayIndicator extends StatelessWidget {
  final String day;
  final bool active;

  const _DayIndicator({required this.day, required this.active});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? HomeScreen.saffron : const Color(0xFFE0DBD2),
            boxShadow: active
                ? const [
                    BoxShadow(
                      color: Color(0x40E7A13B),
                      blurRadius: 0,
                      spreadRadius: 4,
                    ),
                  ]
                : null,
          ),
        ),
        const SizedBox(height: 8),
        Text(day, style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
      ],
    );
  }
}

// ═══════════════════════════════════════════
// QUICK LEARNING CARD
// ═══════════════════════════════════════════

class QuickLearningCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String deva;
  final VoidCallback onTap;

  const QuickLearningCard({
    super.key,
    required this.icon,
    required this.title,
    required this.deva,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: HomeScreen.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: HomeScreen.border),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Decorative mandala
            const Positioned(
              right: -22,
              top: -22,
              child: SizedBox(
                width: 78,
                height: 78,
                child: HomeMandala(opacity: 0.15),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0x15354A82),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(icon, size: 21, color: HomeScreen.blue),
                ),

                const Spacer(),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: HomeScreen.brown,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  deva,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════
// GOLD SEPARATOR
// ═══════════════════════════════════════════

class GoldSeparator extends StatelessWidget {
  const GoldSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: const Color(0x66C79B45))),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '◇',
            style: TextStyle(color: HomeScreen.gold, fontSize: 13),
          ),
        ),
        Expanded(child: Container(height: 1, color: const Color(0x66C79B45))),
      ],
    );
  }
}

// ═══════════════════════════════════════════
// MANDALA
// ═══════════════════════════════════════════

class HomeMandala extends StatelessWidget {
  final double opacity;

  const HomeMandala({super.key, this.opacity = 0.40});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: HomeMandalaPainter(opacity: opacity));
  }
}

class HomeMandalaPainter extends CustomPainter {
  final double opacity;

  HomeMandalaPainter({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final radius = math.min(size.width, size.height) / 2;

    final paint = Paint()
      ..color = HomeScreen.gold.withValues(alpha: opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    // Rings
    for (final r in [radius * .3, radius * .52, radius * .76, radius * .94]) {
      canvas.drawCircle(center, r, paint);
    }

    canvas.save();

    canvas.translate(center.dx, center.dy);

    // Petals
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
