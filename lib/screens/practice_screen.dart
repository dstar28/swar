import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'learn_screen.dart';
import '../widgets/bottom_nav.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  static const background = Color(0xFFFAF7EF);
  static const card = Color(0xFFFFFDF8);
  static const brown = Color(0xFF4D4033);
  static const blue = Color(0xFF203B91);
  static const gold = Color(0xFFC79B45);
  static const border = Color(0xFFE7DECD);

  Timer? timer;
  Duration elapsed = Duration.zero;
  bool isRecording = false;
  bool hasSubmitted = false;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void toggleRecording() {
    if (isRecording) {
      timer?.cancel();
      setState(() => isRecording = false);
      return;
    }

    setState(() {
      isRecording = true;
      hasSubmitted = false;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() => elapsed += const Duration(seconds: 1));
      }
    });
  }

  void resetRecording() {
    timer?.cancel();
    setState(() {
      elapsed = Duration.zero;
      isRecording = false;
      hasSubmitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            const _PracticeHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SoundCard(),
                    const SizedBox(height: 26),
                    const _PracticeSectionLabel(
                      title: 'श्रवणम्',
                      subtitle: 'LISTEN CAREFULLY',
                    ),
                    const SizedBox(height: 12),
                    const _ListenCard(),
                    const SizedBox(height: 29),
                    const _GoldSeparator(),
                    const SizedBox(height: 27),
                    const _PracticeSectionLabel(
                      title: 'अभ्यासः',
                      subtitle: 'YOUR TURN',
                    ),
                    const SizedBox(height: 12),
                    _RecordingCard(
                      isRecording: isRecording,
                      elapsed: elapsed,
                      hasSubmitted: hasSubmitted,
                      onRecord: toggleRecording,
                      onReset: resetRecording,
                      onSubmit: () {
                        if (elapsed == Duration.zero) return;
                        setState(() {
                          timer?.cancel();
                          isRecording = false;
                          hasSubmitted = true;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Recording and evaluation use mock data in this prototype.',
                      style: TextStyle(fontSize: 11, color: Color(0xFF77716A)),
                    ),
                  ],
                ),
              ),
            ),
            const BottomNav(currentIndex: 2),
          ],
        ),
      ),
    );
  }
}

class _PracticeHeader extends StatelessWidget {
  const _PracticeHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFCF5),
        border: Border(bottom: BorderSide(color: _PracticeScreenState.border)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: _PracticeScreenState.blue,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              'स्वर',
              style: TextStyle(fontSize: 11, color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Practice: ट',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _PracticeScreenState.brown,
                ),
              ),
              Text(
                'मूर्धन्य · Retroflex',
                style: TextStyle(fontSize: 11, color: Color(0xFF77716A)),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: null,
            icon: Icon(
              Icons.dark_mode_outlined,
              color: _PracticeScreenState.brown,
            ),
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(
                _PracticeScreenState.card,
              ),
              side: const WidgetStatePropertyAll(
                BorderSide(color: _PracticeScreenState.border),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SoundCard extends StatelessWidget {
  const _SoundCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: _PracticeScreenState.card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: _PracticeScreenState.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 165,
            height: 165,
            child: CustomPaint(painter: _PracticeMandalaPainter()),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ट',
                style: TextStyle(
                  fontSize: 66,
                  height: 1,
                  color: _PracticeScreenState.brown,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'ṭa',
                style: TextStyle(fontSize: 12, color: Color(0xFF77716A)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PracticeSectionLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const _PracticeSectionLabel({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              '⌘',
              style: TextStyle(fontSize: 13, color: _PracticeScreenState.gold),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                color: _PracticeScreenState.brown,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 21, top: 3),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              letterSpacing: 1.8,
              color: Color(0xFF77716A),
            ),
          ),
        ),
      ],
    );
  }
}

class _ListenCard extends StatelessWidget {
  const _ListenCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0x0AE7A13B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _PracticeScreenState.border),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: _PracticeScreenState.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 29,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🔊 Play correct pronunciation',
                  style: TextStyle(
                    fontSize: 13,
                    color: _PracticeScreenState.brown,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'मूर्धन्य · ṭa-mātar',
                  style: TextStyle(fontSize: 11, color: Color(0xFF77716A)),
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 0,
                  minHeight: 5,
                  backgroundColor: Color(0x22A89572),
                  color: _PracticeScreenState.gold,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.volume_up_outlined,
            size: 18,
            color: Color(0xFF776B5D),
          ),
        ],
      ),
    );
  }
}

class _RecordingCard extends StatelessWidget {
  final bool isRecording;
  final Duration elapsed;
  final bool hasSubmitted;
  final VoidCallback onRecord;
  final VoidCallback onReset;
  final VoidCallback onSubmit;

  const _RecordingCard({
    required this.isRecording,
    required this.elapsed,
    required this.hasSubmitted,
    required this.onRecord,
    required this.onReset,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final seconds = elapsed.inSeconds.toString().padLeft(2, '0');
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 22, 14, 14),
      decoration: BoxDecoration(
        color: _PracticeScreenState.card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: _PracticeScreenState.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onRecord,
            customBorder: const CircleBorder(),
            child: Container(
              width: 106,
              height: 106,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _PracticeScreenState.border),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x10000000),
                    blurRadius: 12,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                isRecording ? Icons.stop_rounded : Icons.mic_none_rounded,
                size: 44,
                color: _PracticeScreenState.blue,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            hasSubmitted
                ? 'Recording submitted'
                : isRecording
                ? 'Recording…'
                : 'Tap to Record',
            style: const TextStyle(
              fontSize: 14,
              color: _PracticeScreenState.brown,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'उच्चारय कुरु',
            style: TextStyle(fontSize: 12, color: Color(0xFF77716A)),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              28,
              (_) => Container(
                width: 4,
                height: 7,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFE7DECD),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 17),
          Text(
            '00:$seconds',
            style: const TextStyle(fontSize: 11, color: Color(0xFF77716A)),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onReset,
                  icon: const Icon(Icons.replay_rounded, size: 17),
                  label: const Text('Reset'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _PracticeScreenState.brown,
                    side: const BorderSide(color: _PracticeScreenState.border),
                    minimumSize: const Size(0, 46),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: elapsed == Duration.zero ? null : onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC18F),
                    foregroundColor: _PracticeScreenState.brown,
                    disabledBackgroundColor: const Color(0xFFFFC18F),
                    disabledForegroundColor: const Color(0x88776B5D),
                    elevation: 0,
                    minimumSize: const Size(0, 46),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GoldSeparator extends StatelessWidget {
  const _GoldSeparator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider(color: Color(0x66C79B45))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('◇', style: TextStyle(color: _PracticeScreenState.gold)),
        ),
        Expanded(child: Divider(color: Color(0x66C79B45))),
      ],
    );
  }
}

class _PracticeMandalaPainter extends CustomPainter {
  const _PracticeMandalaPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - 8;
    final paint = Paint()
      ..color = const Color(0x20C79B45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (final ring in [radius * .35, radius * .65, radius * .92]) {
      canvas.drawCircle(center, ring, paint);
    }
    for (var index = 0; index < 12; index++) {
      final angle = index * math.pi / 6;
      final end =
          center + Offset(math.cos(angle) * radius, math.sin(angle) * radius);
      canvas.drawLine(center, end, paint);
      canvas.drawOval(
        Rect.fromCenter(
          center:
              center +
              Offset(
                math.cos(angle) * radius * .35,
                math.sin(angle) * radius * .35,
              ),
          width: radius * .7,
          height: radius * .22,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
