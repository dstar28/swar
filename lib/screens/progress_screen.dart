import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const bg = Color(0xFFFAF7EF);
  static const card = Color(0xFFFFFDF8);
  static const blue = Color(0xFF354A82);
  static const brown = Color(0xFF4D4033);
  static const gold = Color(0xFFE7A13B);
  static const border = Color(0xFFE7DECD);
  static const terracotta = Color(0xFFB85C45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),

              const SizedBox(height: 20),

              // STAT CARDS
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.55,
                children: const [
                  _StatCard(
                    value: '87%',
                    label: 'Pronunciation accuracy',
                    dark: true,
                  ),
                  _StatCard(value: '24', label: 'Lessons completed'),
                  _StatCard(
                    value: '7 days',
                    label: 'Practice streak',
                    saffron: true,
                  ),
                  _StatCard(
                    value: '126',
                    label: 'Words mastered',
                    deva: 'शब्दाः',
                  ),
                ],
              ),

              const _SectionHeader(
                deva: 'साप्ताहिक अभ्यासः',
                english: 'Weekly practice (minutes)',
              ),

              _ChartCard(child: _BarChart()),

              const _SectionHeader(
                deva: 'उच्चारण शुद्धिः',
                english: 'Pronunciation accuracy',
              ),

              _ChartCard(child: _AccuracyChart()),

              const _SectionHeader(
                deva: 'पाठाः पूर्णाः',
                english: 'Lessons completed',
              ),

              _ChartCard(height: 190, child: _LessonsChart()),

              const _SectionHeader(
                deva: 'दुर्बल ध्वनयः',
                english: 'Weak sounds to revisit',
              ),

              _weakSounds(),

              const SizedBox(height: 30),

              const Divider(color: border),

              const SizedBox(height: 10),

              const _SectionHeader(deva: 'उपलब्धयः', english: 'Achievements'),

              _achievements(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 3),
    );
  }

  Widget _header() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'प्रगतिः',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: brown,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Your learning analytics',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _weakSounds() {
    const sounds = [
      ['ट', 62],
      ['ठ', 58],
      ['ड', 66],
      ['ढ', 54],
      ['ण', 69],
      ['ष', 64],
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: border),
      ),
      child: Column(
        children: sounds.map((sound) {
          final value = sound[1] as int;

          return Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F0E8),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: border),
                  ),
                  child: Text(
                    sound[0] as String,
                    style: const TextStyle(fontSize: 21, color: blue),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: value / 100,
                      minHeight: 8,
                      backgroundColor: border,
                      color: terracotta,
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                SizedBox(
                  width: 35,
                  child: Text(
                    '$value%',
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _achievements() {
    const achievements = [
      ['🏆', 'प्रथम स्वरः', 'First Sound', true],
      ['🔥', 'अभ्यास योगी', '7 Day Streak', true],
      ['🎙️', 'शुद्ध वाणी', 'Pronunciation Master', true],
      ['📜', 'संस्कृत साधक', 'Sanskrit Learner', false],
      ['🏅', 'उच्चारण सिद्धि', 'Pronunciation Excellence', false],
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.15,
      children: achievements.map((achievement) {
        final unlocked = achievement[3] as bool;

        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: unlocked
                ? const Color(0x15E7A13B)
                : card.withValues(alpha: .65),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: unlocked ? const Color(0x66E7A13B) : border,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                achievement[0] as String,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 7),
              Text(
                achievement[1] as String,
                style: const TextStyle(fontSize: 15, color: brown),
              ),
              const SizedBox(height: 3),
              Text(
                achievement[2] as String,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(
                unlocked ? 'Unlocked' : 'Locked',
                style: TextStyle(
                  fontSize: 10,
                  color: unlocked ? gold : Colors.grey,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final String? deva;
  final bool dark;
  final bool saffron;

  const _StatCard({
    required this.value,
    required this.label,
    this.deva,
    this.dark = false,
    this.saffron = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = dark
        ? const Color(0xFF354A82)
        : saffron
        ? const Color(0x18E7A13B)
        : const Color(0xFFFFFDF8);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: dark
              ? Colors.transparent
              : saffron
              ? const Color(0x66E7A13B)
              : const Color(0xFFE7DECD),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
              color: dark ? Colors.white : const Color(0xFF4D4033),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: dark ? Colors.white70 : Colors.grey,
            ),
          ),
          if (deva != null)
            Text(
              deva!,
              style: const TextStyle(fontSize: 13, color: Color(0xFFE7A13B)),
            ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String deva;
  final String english;

  const _SectionHeader({required this.deva, required this.english});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 10),
      child: Row(
        children: [
          const Text(
            '◇',
            style: TextStyle(color: Color(0xFFE7A13B), fontSize: 17),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                deva,
                style: const TextStyle(fontSize: 17, color: Color(0xFF4D4033)),
              ),
              Text(
                english.toUpperCase(),
                style: const TextStyle(
                  fontSize: 9,
                  letterSpacing: 1.2,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  final Widget child;
  final double height;

  const _ChartCard({required this.child, this.height = 215});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE7DECD)),
      ),
      child: child,
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    const values = [18, 24, 12, 30, 26, 34, 22];
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(values.length, (i) {
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    heightFactor: values[i] / 40,
                    child: Container(
                      width: 25,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE7A13B),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                days[i],
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _AccuracyChart extends StatelessWidget {
  const _AccuracyChart();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LineChartPainter(
        values: const [78, 81, 79, 85, 88, 90, 87],
        color: const Color(0xFF354A82),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _LessonsChart extends StatelessWidget {
  const _LessonsChart();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LineChartPainter(
        values: const [3, 5, 4, 6, 6],
        color: const Color(0xFFE7A13B),
        maxValue: 7,
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  final List<int> values;
  final Color color;
  final double? maxValue;

  _LineChartPainter({required this.values, required this.color, this.maxValue});

  @override
  void paint(Canvas canvas, Size size) {
    final max = maxValue ?? 100;
    final min = maxValue == null ? 50.0 : 0.0;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    for (int i = 0; i < values.length; i++) {
      final x = i * size.width / (values.length - 1);
      final normalized = (values[i] - min) / (max - min);

      final y = size.height - normalized * size.height;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);

    final dotPaint = Paint()..color = color;

    for (int i = 0; i < values.length; i++) {
      final x = i * size.width / (values.length - 1);
      final normalized = (values[i] - min) / (max - min);
      final y = size.height - normalized * size.height;

      canvas.drawCircle(Offset(x, y), 4, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
