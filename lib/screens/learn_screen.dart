import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'letter_detail_screen.dart';
import 'practice_screen.dart';
import '../widgets/bottom_nav.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  static const background = Color(0xFFFAF7EF);
  static const card = Color(0xFFFFFDF8);
  static const brown = Color(0xFF4D4033);
  static const blue = Color(0xFF354A82);
  static const gold = Color(0xFFC79B45);
  static const border = Color(0xFFE7DECD);

  static const vowels = [
    ('अ', 'a'),
    ('आ', 'ā'),
    ('इ', 'i'),
    ('ई', 'ī'),
    ('उ', 'u'),
    ('ऊ', 'ū'),
    ('ऋ', 'ṛ'),
    ('ॠ', 'ṝ'),
    ('ए', 'e'),
    ('ऐ', 'ai'),
    ('ओ', 'o'),
    ('औ', 'au'),
  ];

  static const consonantGroups = [
    (
      'क-वर्ग',
      'Guttural series',
      [('क', 'ka'), ('ख', 'kha'), ('ग', 'ga'), ('घ', 'gha'), ('ङ', 'ṅa')],
    ),
    (
      'च-वर्ग',
      'Palatal series',
      [('च', 'ca'), ('छ', 'cha'), ('ज', 'ja'), ('झ', 'jha'), ('ञ', 'ña')],
    ),
    (
      'ट-वर्ग',
      'Retroflex series',
      [('ट', 'ṭa'), ('ठ', 'ṭha'), ('ड', 'ḍa'), ('ढ', 'ḍha'), ('ण', 'ṇa')],
    ),
    (
      'त-वर्ग',
      'Dental series',
      [('त', 'ta'), ('थ', 'tha'), ('द', 'da'), ('ध', 'dha'), ('न', 'na')],
    ),
    (
      'प-वर्ग',
      'Labial series',
      [('प', 'pa'), ('फ', 'pha'), ('ब', 'ba'), ('भ', 'bha'), ('म', 'ma')],
    ),
    (
      'अन्तःस्थ',
      'Semi-vowels',
      [('य', 'ya'), ('र', 'ra'), ('ल', 'la'), ('व', 'va')],
    ),
    (
      'ऊष्म',
      'Sibilants & aspirate',
      [('श', 'śa'), ('ष', 'ṣa'), ('स', 'sa'), ('ह', 'ha')],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            const _LearnHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _LearnShortcut(
                      icon: Icons.graphic_eq_rounded,
                      title: 'संस्कृत ध्वनिविज्ञान',
                      subtitle: 'Phonetics — where each sound originates',
                    ),
                    const SizedBox(height: 12),
                    const _LearnShortcut(
                      icon: Icons.menu_book_outlined,
                      title: 'संस्कृत शब्दाः',
                      subtitle: 'Words — practise everyday vocabulary',
                    ),
                    const SizedBox(height: 12),
                    const _LearnShortcut(
                      icon: Icons.library_books_outlined,
                      title: 'श्लोक अभ्यासः',
                      subtitle: 'Shlokas — guided recitation practice',
                    ),
                    const SizedBox(height: 27),
                    const _SectionLabel(
                      title: 'स्वर',
                      subtitle: 'VOWELS · 12 SOUNDS',
                    ),
                    const SizedBox(height: 12),
                    _LetterGrid(letters: vowels),
                    const SizedBox(height: 28),
                    const _GoldSeparator(),
                    const SizedBox(height: 27),
                    const _SectionLabel(
                      title: 'व्यञ्जन',
                      subtitle: 'CONSONANTS · TRADITIONAL CLASSIFICATION',
                    ),
                    const SizedBox(height: 18),
                    ...consonantGroups.map(
                      (group) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _ConsonantGroup(
                          title: group.$1,
                          subtitle: group.$2,
                          letters: group.$3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const BottomNav(currentIndex: 1),
          ],
        ),
      ),
    );
  }
}

class _LearnShortcut extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _LearnShortcut({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: LearnScreen.card,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$title coming soon'))),
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: LearnScreen.border),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0x18E7A13B),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: LearnScreen.blue, size: 21),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: LearnScreen.brown,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF77716A),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: LearnScreen.brown),
            ],
          ),
        ),
      ),
    );
  }
}

class _LearnHeader extends StatelessWidget {
  const _LearnHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFCF5),
        border: Border(bottom: BorderSide(color: LearnScreen.border)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: LearnScreen.blue,
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
                'संस्कृत वर्णमाला',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: LearnScreen.brown,
                ),
              ),
              Text(
                'Explore the sounds of Sanskrit.',
                style: TextStyle(fontSize: 11, color: Color(0xFF77716A)),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: null,
            icon: Icon(Icons.dark_mode_outlined, color: LearnScreen.brown),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(LearnScreen.card),
              side: WidgetStatePropertyAll(
                BorderSide(color: LearnScreen.border),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionLabel({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, color: LearnScreen.brown),
        ),
        const SizedBox(height: 3),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 10,
            letterSpacing: 1.8,
            color: Color(0xFF77716A),
          ),
        ),
      ],
    );
  }
}

class _LetterGrid extends StatelessWidget {
  final List<(String, String)> letters;

  const _LetterGrid({required this.letters});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        childAspectRatio: 0.92,
      ),
      itemCount: letters.length,
      itemBuilder: (_, index) => _LetterTile(
        letter: letters[index].$1,
        transliteration: letters[index].$2,
      ),
    );
  }
}

class _ConsonantGroup extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<(String, String)> letters;

  const _ConsonantGroup({
    required this.title,
    required this.subtitle,
    required this.letters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: LearnScreen.brown),
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 11, color: Color(0xFF77716A)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: letters
              .map(
                (letter) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: _LetterTile(
                      letter: letter.$1,
                      transliteration: letter.$2,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _LetterTile extends StatelessWidget {
  final String letter;
  final String transliteration;

  const _LetterTile({required this.letter, required this.transliteration});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.92,
      child: Material(
        color: LearnScreen.card,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LetterDetailScreen(
                letter: letter,
                transliteration: transliteration,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: LearnScreen.border),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x10000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  letter,
                  style: const TextStyle(
                    fontSize: 27,
                    color: LearnScreen.brown,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  transliteration,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8B8174),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GoldSeparator extends StatelessWidget {
  const _GoldSeparator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0x66C79B45))),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('◇', style: TextStyle(color: LearnScreen.gold)),
        ),
        const Expanded(child: Divider(color: Color(0x66C79B45))),
      ],
    );
  }
}

