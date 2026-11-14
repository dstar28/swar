import 'package:audioplayers/audioplayers.dart';
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
                      final info =
                          _groupInfo[entry.key] ??
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

// Audio paths are relative to Flutter's assets/ directory.
// A null entry means that recording is not available yet.
const Map<String, List<String?>> _swarWordAudio = {
  'अ': [
    'sounds/words/swar/01_a_01_agni.wav',
    'sounds/words/swar/01_a_02_a_va.wav',
    null,
  ],
  'आ': [
    'sounds/words/swar/02_word_01_k_a.wav',
    'sounds/words/swar/02_word_02_c_rya.wav',
    'sounds/words/swar/02_word_03_nanda.wav',
  ],
  'इ': [
    null,
    'sounds/words/swar/03_i_02_icch.wav',
    'sounds/words/swar/03_i_03_iti.wav',
  ],
  'ई': [
    'sounds/words/swar/04_word_01_vara.wav',
    'sounds/words/swar/04_word_02_k.wav',
    null,
  ],
  'उ': [null, 'sounds/words/swar/05_u_02_udy_nam.wav', null],
  'ऊ': [
    'sounds/words/swar/06_word_01_r.wav',
    'sounds/words/swar/06_word_02_m.wav',
    'sounds/words/swar/06_word_03_ru.wav',
  ],
  'ऋ': [null, 'sounds/words/swar/07_word_02_tu.wav', null],
  'ॠ': [
    'sounds/words/swar/08_word_01_k_ra.wav',
    'sounds/words/swar/08_word_02_bheda.wav',
  ],
  'ऌ': [null, 'sounds/words/swar/09_word_02_k_ptam.wav'],
  'ॡ': [null, null],
  'ए': [
    'sounds/words/swar/11_e_01_eka.wav',
    'sounds/words/swar/11_e_02_eva.wav',
    'sounds/words/swar/11_e_03_etat.wav',
  ],
  'ऐ': [
    'sounds/words/swar/12_ai_01_ai_varyam.wav',
    'sounds/words/swar/12_ai_02_aikyam.wav',
    'sounds/words/swar/12_ai_03_air_vata.wav',
  ],
  'ओ': [
    'sounds/words/swar/13_o_01_oja.wav',
    'sounds/words/swar/13_o_02_o_adhi.wav',
    'sounds/words/swar/13_o_03_odana.wav',
  ],
  'औ': [
    'sounds/words/swar/14_au_01_au_adham.wav',
    'sounds/words/swar/14_au_02_aucityam.wav',
    'sounds/words/swar/14_au_03_aud_ryam.wav',
  ],
  'अं': [
    'sounds/words/swar/15_a_01_a_a.wav',
    'sounds/words/swar/15_a_02_a_kura.wav',
    'sounds/words/swar/15_a_03_a_gam.wav',
  ],
  'अः': [
    'sounds/words/swar/16_a_01_ata.wav',
    'sounds/words/swar/16_a_02_pr_ta.wav',
    'sounds/words/swar/16_a_03_phalata.wav',
  ],
};

const Map<String, List<String?>> _vyanjanWordAudio = {
  'क': [
    null,
    'sounds/words/vyanjan/01_ka_02_kapi.wav',
    'sounds/words/vyanjan/01_ka_03_kath.wav',
  ],
  'ख': [
    'sounds/words/vyanjan/02_kha_01_khaga.wav',
    'sounds/words/vyanjan/02_kha_02_kha_ga.wav',
    'sounds/words/vyanjan/02_kha_03_khanati.wav',
  ],
  'ग': [null, null, 'sounds/words/vyanjan/03_ga_03_gaganam.wav'],
  'घ': [
    'sounds/words/vyanjan/04_gha_01_gha_a.wav',
    'sounds/words/vyanjan/04_gha_02_ghana.wav',
    null,
  ],
  'ङ': [
    'sounds/words/vyanjan/05_a_01_a_gam.wav',
    'sounds/words/vyanjan/05_a_02_ga_g.wav',
    'sounds/words/vyanjan/05_a_03_a_ka.wav',
  ],
  'च': [
    'sounds/words/vyanjan/06_ca_01_candra.wav',
    'sounds/words/vyanjan/06_ca_02_cakram.wav',
    'sounds/words/vyanjan/06_ca_03_calati.wav',
  ],
  'छ': ['sounds/words/vyanjan/07_cha_01_chatram.wav', null, null],
  'ज': [
    'sounds/words/vyanjan/08_ja_01_jalam.wav',
    null,
    'sounds/words/vyanjan/08_ja_03_japa.wav',
  ],
  'ञ': [
    'sounds/words/vyanjan/10_a_01_pa_ca.wav',
    null,
    'sounds/words/vyanjan/10_a_03_sa_caya.wav',
  ],
  'ट': [null, null, 'sounds/words/vyanjan/11_a_03_gha_ik.wav'],
  'ठ': [null, 'sounds/words/vyanjan/12_ha_02_ka_ha.wav', null],
  'ड': [null, null, 'sounds/words/vyanjan/13_a_03_vi_la.wav'],
  'ण': [
    'sounds/words/vyanjan/15_a_01_ga_a.wav',
    'sounds/words/vyanjan/15_a_02_ma_i.wav',
    'sounds/words/vyanjan/15_a_03_var_a.wav',
  ],
  'त': [
    null,
    'sounds/words/vyanjan/16_ta_02_t_r.wav',
    'sounds/words/vyanjan/16_ta_03_tapa.wav',
  ],
  'थ': [
    null,
    'sounds/words/vyanjan/17_tha_02_sth_nam.wav',
    'sounds/words/vyanjan/17_tha_03_patha.wav',
  ],
  'ध': [
    null,
    'sounds/words/vyanjan/19_dha_02_dharma.wav',
    'sounds/words/vyanjan/19_dha_03_dh_r.wav',
  ],
  'न': [null, null, 'sounds/words/vyanjan/20_na_03_nayanam.wav'],
  'प': [
    null,
    'sounds/words/vyanjan/21_pa_02_pustakam.wav',
    'sounds/words/vyanjan/21_pa_03_pavana.wav',
  ],
  'फ': ['sounds/words/vyanjan/22_pha_01_phalam.wav', null, null],
  'ब': ['sounds/words/vyanjan/23_ba_01_b_la.wav', null, null],
  'भ': [
    'sounds/words/vyanjan/24_bha_01_bhavanam.wav',
    'sounds/words/vyanjan/24_bha_02_bh_nu.wav',
    'sounds/words/vyanjan/24_bha_03_bhakti.wav',
  ],
  'म': [
    'sounds/words/vyanjan/25_ma_01_m_t.wav',
    'sounds/words/vyanjan/25_ma_02_mitram.wav',
    null,
  ],
  'य': [
    'sounds/words/vyanjan/26_ya_01_yaj_a.wav',
    'sounds/words/vyanjan/26_ya_02_yoga.wav',
    null,
  ],
  'र': [null, 'sounds/words/vyanjan/27_ra_02_r_j.wav', null],
  'ल': [
    'sounds/words/vyanjan/28_la_01_lat.wav',
    'sounds/words/vyanjan/28_la_02_lak_m.wav',
    'sounds/words/vyanjan/28_la_03_lava.wav',
  ],
  'व': [
    'sounds/words/vyanjan/29_va_01_vanam.wav',
    'sounds/words/vyanjan/29_va_02_v_yu.wav',
    null,
  ],
  'श': [
    'sounds/words/vyanjan/30_a_01_a_a.wav',
    'sounds/words/vyanjan/30_a_02_iva.wav',
    'sounds/words/vyanjan/30_a_03_l.wav',
  ],
  'ष': [
    'sounds/words/vyanjan/31_a_01_a.wav',
    null,
    'sounds/words/vyanjan/31_a_03_k_a.wav',
  ],
  'स': [
    'sounds/words/vyanjan/32_sa_01_s_rya.wav',
    null,
    'sounds/words/vyanjan/32_sa_03_sakh.wav',
  ],
  'ह': [
    'sounds/words/vyanjan/33_ha_01_hari.wav',
    null,
    'sounds/words/vyanjan/33_ha_03_hasta.wav',
  ],
};

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
            _WordsDetailHeader(
              letter: letter,
              transliteration: transliteration,
            ),
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
                          audioAsset:
                              (entry['group'] == null
                                          ? _swarWordAudio[letter]
                                          : _vyanjanWordAudio[letter]) !=
                                      null &&
                                  index <
                                      (entry['group'] == null
                                              ? _swarWordAudio[letter]!
                                              : _vyanjanWordAudio[letter]!)
                                          .length
                              ? (entry['group'] == null
                                    ? _swarWordAudio[letter]![index]
                                    : _vyanjanWordAudio[letter]![index])
                              : null,
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
          const Icon(Icons.menu_book_rounded, color: PracticeWordsScreen.blue),
        ],
      ),
    );
  }
}

class _PracticeWordCard extends StatefulWidget {
  final int number;
  final String sanskrit;
  final String transliteration;
  final String meaning;
  final String? audioAsset;

  const _PracticeWordCard({
    required this.number,
    required this.sanskrit,
    required this.transliteration,
    required this.meaning,
    this.audioAsset,
  });

  @override
  State<_PracticeWordCard> createState() => _PracticeWordCardState();
}

class _PracticeWordCardState extends State<_PracticeWordCard> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _isPlaying = false);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio() async {
    final asset = widget.audioAsset;
    if (asset == null) return;

    try {
      await _audioPlayer.stop();
      setState(() => _isPlaying = true);
      await _audioPlayer.play(AssetSource(asset));
    } catch (error) {
      if (!mounted) return;
      setState(() => _isPlaying = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not play this recording.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasAudio = widget.audioAsset != null;

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
              '${widget.number}',
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
                  widget.sanskrit,
                  style: const TextStyle(
                    fontSize: 23,
                    height: 1.2,
                    color: PracticeWordsScreen.brown,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.transliteration,
                  style: const TextStyle(
                    fontSize: 12,
                    color: PracticeWordsScreen.blue,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  widget.meaning,
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
            color: hasAudio ? const Color(0x15354A82) : const Color(0x108A8175),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: hasAudio ? _playAudio : null,
              child: SizedBox(
                width: 42,
                height: 42,
                child: Icon(
                  !hasAudio
                      ? Icons.volume_off_rounded
                      : (_isPlaying
                            ? Icons.volume_up_rounded
                            : Icons.play_arrow_rounded),
                  color: hasAudio
                      ? PracticeWordsScreen.blue
                      : const Color(0xFFB7AFA3),
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
