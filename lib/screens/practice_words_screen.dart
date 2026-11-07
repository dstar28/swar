import 'package:flutter/material.dart';

import '../data/swar_practice_words_data.dart';
import '../widgets/bottom_nav.dart';

class PracticeWordsScreen extends StatelessWidget {
  const PracticeWordsScreen({super.key});

  static const background = Color(0xFFFAF7EF);
  static const card = Color(0xFFFFFDF8);
  static const brown = Color(0xFF4D4033);
  static const blue = Color(0xFF354A82);
  static const gold = Color(0xFFC79B45);
  static const border = Color(0xFFE7DECD);

  List<Map<String, dynamic>> _entries(String key) {
    return (swarPracticeWordsData[key] as List)
        .map((entry) => Map<String, dynamic>.from(entry as Map))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final swar = _entries('swar');
    final vyanjan = _entries('vyanjan');
    final groups = <String, List<Map<String, dynamic>>>{};
    for (final entry in vyanjan) {
      final sourceGroup = entry['group'] as String? ?? 'other';
      // The dataset separates sibilants and aspirate, while the Learn page
      // presents them together under the traditional ऊष्म heading.
      final group = (sourceGroup == 'sibilant' || sourceGroup == 'aspirate')
          ? 'ushma'
          : sourceGroup;
      groups.putIfAbsent(group, () => []).add(entry);
    }

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            const _WordsHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: card,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0x66C79B45)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 14,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'शब्द अभ्यासः',
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Choose a sound and explore Sanskrit words',
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.4,
                                    color: Color(0xFF77716A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              color: const Color(0x18C79B45),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.menu_book_rounded,
                              color: gold,
                              size: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    const _WordsSectionLabel(
                      title: 'स्वर',
                      subtitle: 'VOWELS · 16 SOUNDS',
                    ),
                    const SizedBox(height: 12),
                    _WordsLetterGrid(entries: swar),
                    const SizedBox(height: 28),
                    const _WordsSeparator(),
                    const SizedBox(height: 27),
                    const _WordsSectionLabel(
                      title: 'व्यञ्जन',
                      subtitle: 'CONSONANTS · 33 SOUNDS',
                    ),
                    const SizedBox(height: 18),
                    ...groups.entries.map((entry) {
                      final info = _groupInfo[entry.key] ??
                          (entry.key.toUpperCase(), 'Consonants');
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  info.$1,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: brown,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  info.$2,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF8A8175),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            _WordsLetterGrid(entries: entry.value),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 4),
                    const Text(
                      'Select any letter to view its practice words.',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF77716A),
                      ),
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

const Map<String, (String, String)> _groupInfo = {
  'velar': ('क-वर्ग', 'Guttural series'),
  'palatal': ('च-वर्ग', 'Palatal series'),
  'retroflex': ('ट-वर्ग', 'Retroflex series'),
  'dental': ('त-वर्ग', 'Dental series'),
  'labial': ('प-वर्ग', 'Labial series'),
  'semivowel': ('अन्तःस्थ', 'Semi-vowels'),
  'ushma': ('ऊष्म', 'Sibilants & aspirate'),
};

class _WordsHeader extends StatelessWidget {
  const _WordsHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFCF5),
        border: Border(bottom: BorderSide(color: PracticeWordsScreen.border)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: PracticeWordsScreen.blue,
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
                'Practice Words',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: PracticeWordsScreen.brown,
                ),
              ),
              Text(
                'संस्कृत शब्दाः',
                style: TextStyle(fontSize: 11, color: Color(0xFF77716A)),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Back',
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: PracticeWordsScreen.brown,
            ),
          ),
        ],
      ),
    );
  }
}

class _WordsSectionLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const _WordsSectionLabel({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              '⌘',
              style: TextStyle(fontSize: 13, color: PracticeWordsScreen.gold),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: PracticeWordsScreen.brown,
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 9,
            letterSpacing: 1.2,
            color: Color(0xFF8A8175),
          ),
        ),
      ],
    );
  }
}

class _WordsLetterGrid extends StatelessWidget {
  final List<Map<String, dynamic>> entries;

  const _WordsLetterGrid({required this.entries});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: entries.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: .92,
      ),
      itemBuilder: (context, index) {
        final entry = entries[index];
        final isAdvanced = entry['level'] == 'rare_or_advanced';
        return Material(
          color: PracticeWordsScreen.card,
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PracticeWordsDetailScreen(entry: entry),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: PracticeWordsScreen.border),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x08000000),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          entry['letter'] as String,
                          style: const TextStyle(
                            fontSize: 29,
                            height: 1.15,
                            color: PracticeWordsScreen.brown,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          entry['transliteration'] as String,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF77716A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isAdvanced)
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: PracticeWordsScreen.gold,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PracticeWordsDetailScreen extends StatelessWidget {
  final Map<String, dynamic> entry;

  const PracticeWordsDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final letter = entry['letter'] as String;
    final transliteration = entry['transliteration'] as String;
    final words = (entry['words'] as List)
        .map((word) => Map<String, dynamic>.from(word as Map))
        .toList();
    final isAdvanced = entry['level'] == 'rare_or_advanced';

    return Scaffold(
      backgroundColor: PracticeWordsScreen.background,
      body: SafeArea(
        child: Column(
          children: [
            _WordsDetailHeader(letter: letter, transliteration: transliteration),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: PracticeWordsScreen.card,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(color: PracticeWordsScreen.border),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            letter,
                            style: const TextStyle(
                              fontSize: 66,
                              height: 1.1,
                              color: PracticeWordsScreen.brown,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            transliteration,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF77716A),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0x18C79B45),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${words.length} practice ${words.length == 1 ? 'word' : 'words'}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: PracticeWordsScreen.brown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    Row(
                      children: [
                        const Expanded(
                          child: _WordsSectionLabel(
                            title: 'उदाहरणानि',
                            subtitle: 'PRACTICE WORDS',
                          ),
                        ),
                        if (isAdvanced)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0x18C79B45),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'ADVANCED',
                              style: TextStyle(
                                fontSize: 9,
                                letterSpacing: .6,
                                color: PracticeWordsScreen.brown,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    ...words.asMap().entries.map((item) {
                      final index = item.key;
                      final word = item.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _PracticeWordCard(
                          number: index + 1,
                          sanskrit: word['sanskrit'] as String,
                          transliteration: word['transliteration'] as String,
                          meaning: word['meaning'] as String,
                        ),
                      );
                    }),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF8E9),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: const Color(0x55C79B45)),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.lightbulb_outline_rounded,
                            color: PracticeWordsScreen.gold,
                            size: 19,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Read each word aloud and focus on the selected sound.',
                              style: TextStyle(
                                fontSize: 11,
                                height: 1.45,
                                color: PracticeWordsScreen.brown,
                              ),
                            ),
                          ),
                        ],
                      ),
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

class _WordsDetailHeader extends StatelessWidget {
  final String letter;
  final String transliteration;

  const _WordsDetailHeader({
    required this.letter,
    required this.transliteration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 20, 8),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFCF5),
        border: Border(bottom: BorderSide(color: PracticeWordsScreen.border)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(Icons.arrow_back_rounded),
            color: PracticeWordsScreen.brown,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Practice: $letter',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: PracticeWordsScreen.brown,
                  ),
                ),
                Text(
                  transliteration,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF77716A),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.menu_book_rounded,
            color: PracticeWordsScreen.blue,
          ),
        ],
      ),
    );
  }
}

class _PracticeWordCard extends StatelessWidget {
  final int number;
  final String sanskrit;
  final String transliteration;
  final String meaning;

  const _PracticeWordCard({
    required this.number,
    required this.sanskrit,
    required this.transliteration,
    required this.meaning,
  });

  void _showNoAudio(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: PracticeWordsScreen.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        icon: const Icon(
          Icons.volume_off_rounded,
          color: PracticeWordsScreen.gold,
          size: 30,
        ),
        title: const Text(
          'No audio available',
          style: TextStyle(
            color: PracticeWordsScreen.brown,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: const Text(
          'The pronunciation recording for this word will be added soon.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF77716A),
            fontSize: 12,
            height: 1.45,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Got it',
              style: TextStyle(
                color: PracticeWordsScreen.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 12, 15),
      decoration: BoxDecoration(
        color: PracticeWordsScreen.card,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(color: PracticeWordsScreen.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x09000000),
            blurRadius: 9,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 29,
            height: 29,
            decoration: const BoxDecoration(
              color: Color(0x18C79B45),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '$number',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: PracticeWordsScreen.brown,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sanskrit,
                  style: const TextStyle(
                    fontSize: 23,
                    height: 1.2,
                    color: PracticeWordsScreen.brown,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transliteration,
                  style: const TextStyle(
                    fontSize: 12,
                    color: PracticeWordsScreen.blue,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  meaning,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF77716A),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: const Color(0x15354A82),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => _showNoAudio(context),
              child: const SizedBox(
                width: 42,
                height: 42,
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: PracticeWordsScreen.blue,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WordsSeparator extends StatelessWidget {
  const _WordsSeparator();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: PracticeWordsScreen.border)),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            color: PracticeWordsScreen.gold,
            shape: BoxShape.circle,
          ),
        ),
        const Expanded(child: Divider(color: PracticeWordsScreen.border)),
      ],
    );
  }
}
