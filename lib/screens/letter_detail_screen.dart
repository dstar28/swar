import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'practice_screen.dart';

const Map<String, String> audioFiles = {
  // Vowels
  'अ': 'sounds/vowels/vowel_a.wav',
  'आ': 'sounds/vowels/vowel_aa.wav',
  'इ': 'sounds/vowels/vowel_i.wav',
  'ई': 'sounds/vowels/vowel_ii.wav',
  'उ': 'sounds/vowels/vowel_u.wav',
  'ऊ': 'sounds/vowels/vowel_uu.wav',
  'ऋ': 'sounds/vowels/vowel_r.wav',
  'ए': 'sounds/vowels/vowel_e.wav',
  'ऐ': 'sounds/vowels/vowel_ai.wav',
  'ओ': 'sounds/vowels/vowel_o.wav',
  'औ': 'sounds/vowels/vowel_au.wav',
  'अं': 'sounds/vowels/anusvara.wav',
  'अः': 'sounds/vowels/visarga.wav',

  // Consonants
  'घ': 'sounds/consonants/gha.wav',
  'ख': 'sounds/consonants/kha.wav',
  'छ': 'sounds/consonants/chha.wav',
  'ज': 'sounds/consonants/ja.wav',
  'झ': 'sounds/consonants/jha.wav',
  'ड': 'sounds/consonants/da_retroflex.wav',
  'ढ': 'sounds/consonants/dha_retroflex.wav',
  'त': 'sounds/consonants/ta_dental.wav',
  'थ': 'sounds/consonants/tha_dental.wav',
  'ध': 'sounds/consonants/dha_dental.wav',
  'न': 'sounds/consonants/na_dental.wav',
  'ब': 'sounds/consonants/ba.wav',
  'म': 'sounds/consonants/ma.wav',
  'र': 'sounds/consonants/ra.wav',
  'ल': 'sounds/consonants/la.wav',
  'व': 'sounds/consonants/va.wav',
  'श': 'sounds/consonants/sha.wav',
};

class LetterDetailScreen extends StatelessWidget {
  final String letter;
  final String transliteration;

  const LetterDetailScreen({
    super.key,
    required this.letter,
    required this.transliteration,
  });

  static const background = Color(0xFFFAF7EF);
  static const card = Color(0xFFFFFDF8);
  static const brown = Color(0xFF4D4033);
  static const blue = Color(0xFF203B91);
  static const gold = Color(0xFFC79B45);
  static const border = Color(0xFFE7DECD);

  bool get isVowel => const [
    'अ',
    'आ',
    'इ',
    'ई',
    'उ',
    'ऊ',
    'ऋ',
    'ॠ',
    'ए',
    'ऐ',
    'ओ',
    'औ',
  ].contains(letter);

  @override
  Widget build(BuildContext context) {
    final example = isVowel ? '$letter — उदकम्' : '$letter — नमः';

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            _DetailHeader(letter: letter),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SoundCard(
                      letter: letter,
                      transliteration: transliteration,
                    ),
                    const SizedBox(height: 26),
                    const _DetailSectionLabel(
                      title: 'शुद्ध उच्चारणम्',
                      subtitle: 'CORRECT PRONUNCIATION',
                    ),
                    const SizedBox(height: 12),
                    _AudioCard(
                      label: 'Listen — $letter',
                      subtitle: 'Traditional articulation',
                      audioPath: audioFiles[letter],
                    ),
                    const SizedBox(height: 24),
                    const _DetailSectionLabel(
                      title: 'उच्चारण स्थानम्',
                      subtitle: 'PLACE OF ARTICULATION',
                    ),
                    const SizedBox(height: 12),
                    _ArticulationCard(
                      letter: letter,
                      transliteration: transliteration,
                    ),
                    const SizedBox(height: 25),
                    const _DetailSectionLabel(
                      title: 'उदाहरणम्',
                      subtitle: 'EXAMPLE',
                    ),
                    const SizedBox(height: 12),
                    _AudioCard(
                      label: example,
                      subtitle: isVowel
                          ? 'udakam · water'
                          : 'namaḥ · salutation',
                    ),
                    const SizedBox(height: 24),
                    const _DetailSectionLabel(
                      title: 'सूचना',
                      subtitle: 'PRONUNCIATION TIP',
                    ),
                    const SizedBox(height: 12),
                    const _TipCard(),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PracticeScreen(),
                          ),
                        ),
                        icon: const Icon(Icons.mic_none_rounded, size: 18),
                        label: Text('Practise $letter'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF9B32),
                          foregroundColor: const Color(0xFF332719),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const _DetailNavigation(),
          ],
        ),
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  final String letter;

  const _DetailHeader({required this.letter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFCF5),
        border: Border(bottom: BorderSide(color: LetterDetailScreen.border)),
      ),
      child: Row(
        children: [
          IconButton(
            tooltip: 'Back to alphabet',
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: LetterDetailScreen.brown,
            ),
            style: IconButton.styleFrom(
              side: const BorderSide(color: LetterDetailScreen.border),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'वर्ण · $letter',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: LetterDetailScreen.brown,
                ),
              ),
              const Text(
                'स्वर',
                style: TextStyle(fontSize: 11, color: Color(0xFF77716A)),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: null,
            icon: const Icon(
              Icons.dark_mode_outlined,
              color: LetterDetailScreen.brown,
            ),
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(
                LetterDetailScreen.card,
              ),
              side: const WidgetStatePropertyAll(
                BorderSide(color: LetterDetailScreen.border),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SoundCard extends StatelessWidget {
  final String letter;
  final String transliteration;

  const _SoundCard({required this.letter, required this.transliteration});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 222,
      decoration: BoxDecoration(
        color: LetterDetailScreen.card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: LetterDetailScreen.border),
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
            width: 190,
            height: 190,
            child: CustomPaint(painter: _DetailMandalaPainter()),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                letter,
                style: const TextStyle(
                  fontSize: 75,
                  height: 1,
                  color: LetterDetailScreen.brown,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                transliteration,
                style: const TextStyle(
                  fontSize: 13,
                  color: LetterDetailScreen.blue,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Sanskrit sound · $transliteration',
                style: const TextStyle(fontSize: 12, color: Color(0xFF77716A)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailSectionLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const _DetailSectionLabel({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('⌘', style: TextStyle(color: LetterDetailScreen.gold)),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                color: LetterDetailScreen.brown,
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
              letterSpacing: 1.7,
              color: Color(0xFF77716A),
            ),
          ),
        ),
      ],
    );
  }
}

class _AudioCard extends StatefulWidget {
  final String label;
  final String subtitle;
  final String? audioPath;

  const _AudioCard({
    required this.label,
    required this.subtitle,
    this.audioPath,
  });

  @override
  State<_AudioCard> createState() => _AudioCardState();
}

class _AudioCardState extends State<_AudioCard> {
  final AudioPlayer _player = AudioPlayer();

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    _player.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  Future<void> _toggleAudio() async {
    if (widget.audioPath == null) {
      return;
    }

    if (_isPlaying) {
      await _player.stop();

      if (mounted) {
        setState(() {
          _isPlaying = false;
        });
      }

      return;
    }

    await _player.play(AssetSource(widget.audioPath!));

    if (mounted) {
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasAudio = widget.audioPath != null;

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0x0AE7A13B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LetterDetailScreen.border),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: hasAudio ? _toggleAudio : null,
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: hasAudio
                    ? LetterDetailScreen.blue
                    : const Color(0xFFBDB7AC),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isPlaying ? Icons.stop_rounded : Icons.play_arrow_rounded,
                color: Colors.white,
                size: 29,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 13,
                    color: LetterDetailScreen.brown,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF77716A),
                  ),
                ),

                const SizedBox(height: 7),

                LinearProgressIndicator(
                  value: _isPlaying ? null : 0,
                  minHeight: 5,
                  backgroundColor: const Color(0x22A89572),
                  color: LetterDetailScreen.gold,
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Icon(
            Icons.volume_up_outlined,
            size: 18,
            color: hasAudio ? const Color(0xFF776B5D) : const Color(0xFFBDB7AC),
          ),
        ],
      ),
    );
  }
}

class _ArticulationCard extends StatelessWidget {
  final String letter;
  final String transliteration;

  const _ArticulationCard({
    required this.letter,
    required this.transliteration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: LetterDetailScreen.card,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: LetterDetailScreen.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0x18354A82),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.record_voice_over_outlined,
              color: LetterDetailScreen.blue,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ओष्ठ्य',
                  style: const TextStyle(
                    fontSize: 17,
                    color: LetterDetailScreen.brown,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Labial — $transliteration',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF77716A),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Rounded lips, short duration.',
                  style: TextStyle(fontSize: 13, color: Color(0xFF77716A)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0x14E7A13B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0x66C79B45)),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.lightbulb_outline_rounded,
            color: LetterDetailScreen.gold,
            size: 20,
          ),
          SizedBox(width: 12),
          Text(
            'Round the lips fully but briefly.',
            style: TextStyle(fontSize: 13, color: LetterDetailScreen.brown),
          ),
        ],
      ),
    );
  }
}

class _DetailNavigation extends StatelessWidget {
  const _DetailNavigation();

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
        border: Border(top: BorderSide(color: LetterDetailScreen.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items
            .map(
              (item) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.$1,
                    size: 22,
                    color: item.$2 == 'Learn'
                        ? LetterDetailScreen.blue
                        : const Color(0xFF776B5D),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.$2,
                    style: TextStyle(
                      fontSize: 10,
                      color: item.$2 == 'Learn'
                          ? LetterDetailScreen.blue
                          : const Color(0xFF776B5D),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class _DetailMandalaPainter extends CustomPainter {
  const _DetailMandalaPainter();

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
      final angle = index * 3.14159 / 6;
      canvas.drawLine(
        center,
        center + Offset(radius * math.cos(angle), radius * math.sin(angle)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
