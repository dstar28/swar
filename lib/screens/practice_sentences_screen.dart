import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';

class _Sentence {
  final String id;
  final String sanskrit;
  final String transliteration;
  final String meaning;

  const _Sentence({
    required this.id,
    required this.sanskrit,
    required this.transliteration,
    required this.meaning,
  });
}

class _SentenceCategory {
  final String name;
  final String sanskritName;
  final List<_Sentence> sentences;

  const _SentenceCategory({
    required this.name,
    required this.sanskritName,
    required this.sentences,
  });
}

// Sentence audio paths are relative to Flutter's assets/ directory.
// A null entry means that recording is not available yet.
const Map<String, String?> _sentenceAudio = {
  'sentence01': 'sounds/sentences/vowels/sentence01.wav',
  'sentence02': 'sounds/sentences/vowels/sentence02.wav',
  'sentence03': 'sounds/sentences/vowels/sentence03.wav',
  'sentence04': 'sounds/sentences/velars/sentence04.wav',
  'sentence05': 'sounds/sentences/velars/sentence05.wav',
  'sentence06': 'sounds/sentences/velars/sentence06.wav',
  'sentence07': 'sounds/sentences/palatals/sentence07.wav',
  'sentence08': 'sounds/sentences/palatals/sentence08.wav',
  'sentence09': 'sounds/sentences/palatals/sentence09.wav',
  'sentence10': 'sounds/sentences/retroflexes/sentence10.wav',
  'sentence11': 'sounds/sentences/retroflexes/sentence11.wav',
  'sentence12': 'sounds/sentences/retroflexes/sentence12.wav',
  'sentence13': 'sounds/sentences/dentals/sentence13.wav',
  'sentence14': 'sounds/sentences/dentals/sentence14.wav',
  'sentence15': 'sounds/sentences/dentals/sentence15.wav',
  'sentence16': 'sounds/sentences/labials/sentence16.wav',
  'sentence17': 'sounds/sentences/labials/sentence17.wav',
  'sentence18': 'sounds/sentences/labials/sentence18.wav',
  'sentence19': 'sounds/sentences/semivowels/sentence19.wav',
  'sentence20': 'sounds/sentences/semivowels/sentence20.wav',
  'sentence21': 'sounds/sentences/semivowels/sentence21.wav',
  'sentence22': 'sounds/sentences/semivowels/sentence22.wav',
  'sentence23': 'sounds/sentences/sibilants/sentence23.wav',
  'sentence24': 'sounds/sentences/sibilants/sentence24.wav',
  'sentence25': 'sounds/sentences/sibilants/sentence25.wav',
  'sentence26': 'sounds/sentences/mixed/sentence26.wav',
  'sentence27': 'sounds/sentences/mixed/sentence27.wav',
  'sentence28': 'sounds/sentences/mixed/sentence28.wav',
  'sentence29': 'sounds/sentences/mixed/sentence29.wav',
};

class PracticeSentencesScreen extends StatelessWidget {
  const PracticeSentencesScreen({super.key});

  static const background = Color(0xFFFAF7EF);
  static const card = Color(0xFFFFFDF8);
  static const brown = Color(0xFF4D4033);
  static const blue = Color(0xFF354A82);
  static const gold = Color(0xFFC79B45);
  static const border = Color(0xFFE7DECD);

  static const categories = [
    _SentenceCategory(
      name: 'Vowels',
      sanskritName: 'स्वर',
      sentences: [
        _Sentence(
          id: 'sentence01',
          sanskrit: 'अग्निः उज्ज्वलः अस्ति।',
          transliteration: 'agniḥ ujjvalaḥ asti',
          meaning: 'Fire is bright.',
        ),
        _Sentence(
          id: 'sentence02',
          sanskrit: 'आकाशे सूर्यः प्रकाशते।',
          transliteration: 'ākāśe sūryaḥ prakāśate',
          meaning: 'The sun shines in the sky.',
        ),
        _Sentence(
          id: 'sentence03',
          sanskrit: 'ऋषिः आश्रमे वसति।',
          transliteration: 'ṛṣiḥ āśrame vasati',
          meaning: 'The sage lives in the hermitage.',
        ),
      ],
    ),
    _SentenceCategory(
      name: 'Velars',
      sanskritName: 'क-वर्ग',
      sentences: [
        _Sentence(
          id: 'sentence04',
          sanskrit: 'काकः कमले क्रीडति।',
          transliteration: 'kākaḥ kamale krīḍati',
          meaning: 'The crow plays in/on the lotus.',
        ),
        _Sentence(
          id: 'sentence05',
          sanskrit: 'गजः गङ्गायां गच्छति।',
          transliteration: 'gajaḥ gaṅgāyāṃ gacchati',
          meaning: 'The elephant goes to/in the Ganga.',
        ),
        _Sentence(
          id: 'sentence06',
          sanskrit: 'खगः आकाशे उड्डयति।',
          transliteration: 'khagaḥ ākāśe uḍḍayati',
          meaning: 'The bird flies in the sky.',
        ),
      ],
    ),
    _SentenceCategory(
      name: 'Palatals',
      sanskritName: 'च-वर्ग',
      sentences: [
        _Sentence(
          id: 'sentence07',
          sanskrit: 'चन्द्रः छायां जनयति।',
          transliteration: 'candraḥ chāyāṃ janayati',
          meaning: 'The moon creates shade.',
        ),
        _Sentence(
          id: 'sentence08',
          sanskrit: 'जलं जीवनस्य आधारः अस्ति।',
          transliteration: 'jalaṃ jīvanasya ādhāraḥ asti',
          meaning: 'Water is the basis of life.',
        ),
        _Sentence(
          id: 'sentence09',
          sanskrit: 'ज्ञानी जनः सत्यं वदति।',
          transliteration: 'jñānī janaḥ satyaṃ vadati',
          meaning: 'A wise person speaks the truth.',
        ),
      ],
    ),
    _SentenceCategory(
      name: 'Retroflexes',
      sanskritName: 'ट-वर्ग',
      sentences: [
        _Sentence(
          id: 'sentence10',
          sanskrit: 'टङ्कः ध्वनिं करोति।',
          transliteration: 'ṭaṅkaḥ dhvaniṃ karoti',
          meaning: 'The coin makes a sound.',
        ),
        _Sentence(
          id: 'sentence11',
          sanskrit: 'ठक्कुरः डमरुं वादयति।',
          transliteration: 'ṭhakkuraḥ ḍamaruṃ vādayati',
          meaning: 'The Thakkura plays the damaru.',
        ),
        _Sentence(
          id: 'sentence12',
          sanskrit: 'वर्णेषु णकारः महत्त्वपूर्णः अस्ति।',
          transliteration: 'varṇeṣu ṇakāraḥ mahattvapūrṇaḥ asti',
          meaning: 'Among the sounds/letters, ṇa is important.',
        ),
      ],
    ),
    _SentenceCategory(
      name: 'Dentals',
      sanskritName: 'त-वर्ग',
      sentences: [
        _Sentence(
          id: 'sentence13',
          sanskrit: 'तत्त्वं धर्मस्य आधारः अस्ति।',
          transliteration: 'tattvaṃ dharmasya ādhāraḥ asti',
          meaning: 'Truth/principle is the foundation of dharma.',
        ),
        _Sentence(
          id: 'sentence14',
          sanskrit: 'धर्मः जीवनं पवित्रं करोति।',
          transliteration: 'dharmaḥ jīvanaṃ pavitraṃ karoti',
          meaning: 'Dharma makes life sacred.',
        ),
        _Sentence(
          id: 'sentence15',
          sanskrit: 'नदी तीव्रं वहति।',
          transliteration: 'nadī tīvraṃ vahati',
          meaning: 'The river flows swiftly.',
        ),
      ],
    ),
    _SentenceCategory(
      name: 'Labials',
      sanskritName: 'प-वर्ग',
      sentences: [
        _Sentence(
          id: 'sentence16',
          sanskrit: 'पवनः पुष्पाणि चालयति।',
          transliteration: 'pavanaḥ puṣpāṇi cālayati',
          meaning: 'The wind moves the flowers.',
        ),
        _Sentence(
          id: 'sentence17',
          sanskrit: 'फलं पौष्टिकम् अस्ति।',
          transliteration: 'phalaṃ pauṣṭikam asti',
          meaning: 'The fruit is nutritious.',
        ),
        _Sentence(
          id: 'sentence18',
          sanskrit: 'माता बालं पालयति।',
          transliteration: 'mātā bālaṃ pālayati',
          meaning: 'The mother cares for the child.',
        ),
      ],
    ),
    _SentenceCategory(
      name: 'Semivowels',
      sanskritName: 'अन्तःस्थ',
      sentences: [
        _Sentence(
          id: 'sentence19',
          sanskrit: 'योगी यज्ञे भागं गृह्णाति।',
          transliteration: 'yogī yajñe bhāgaṃ gṛhṇāti',
          meaning: 'The yogi takes part in the yajña.',
        ),
        _Sentence(
          id: 'sentence20',
          sanskrit: 'रामः वनं गच्छति।',
          transliteration: 'rāmaḥ vanaṃ gacchati',
          meaning: 'Rama goes to the forest.',
        ),
        _Sentence(
          id: 'sentence21',
          sanskrit: 'लता वृक्षम् आरोहति।',
          transliteration: 'latā vṛkṣam ārohati',
          meaning: 'The creeper climbs the tree.',
        ),
        _Sentence(
          id: 'sentence22',
          sanskrit: 'वाणी मधुरा भवति।',
          transliteration: 'vāṇī madhurā bhavati',
          meaning: 'Speech is sweet.',
        ),
      ],
    ),
    _SentenceCategory(
      name: 'Sibilants',
      sanskritName: 'ऊष्म',
      sentences: [
        _Sentence(
          id: 'sentence23',
          sanskrit: 'शिवः शान्तिं ददाति।',
          transliteration: 'śivaḥ śāntiṃ dadāti',
          meaning: 'Shiva gives peace.',
        ),
        _Sentence(
          id: 'sentence24',
          sanskrit: 'षट् छात्राः उपस्थिताः सन्ति।',
          transliteration: 'ṣaṭ chātrāḥ upasthitāḥ santi',
          meaning: 'Six students are present.',
        ),
        _Sentence(
          id: 'sentence25',
          sanskrit: 'सत्यं सर्वदा वद।',
          transliteration: 'satyaṃ sarvadā vada',
          meaning: 'Always speak the truth.',
        ),
      ],
    ),
    _SentenceCategory(
      name: 'Mixed',
      sanskritName: 'मिश्र',
      sentences: [
        _Sentence(
          id: 'sentence26',
          sanskrit: 'संस्कृतभाषा प्राचीना च समृद्धा च अस्ति।',
          transliteration: 'saṃskṛtabhāṣā prācīnā ca samṛddhā ca asti',
          meaning: 'The Sanskrit language is ancient and rich.',
        ),
        _Sentence(
          id: 'sentence27',
          sanskrit: 'विद्या विनयं ददाति।',
          transliteration: 'vidyā vinayaṃ dadāti',
          meaning: 'Knowledge gives humility.',
        ),
        _Sentence(
          id: 'sentence28',
          sanskrit: 'गुरुः शिष्यं ज्ञानेन प्रेरयति।',
          transliteration: 'guruḥ śiṣyaṃ jñānena prerayati',
          meaning: 'The teacher inspires the student with knowledge.',
        ),
        _Sentence(
          id: 'sentence29',
          sanskrit: 'सर्वे भवन्तु सुखिनः। सर्वे सन्तु निरामयाः।',
          transliteration: 'sarve bhavantu sukhinaḥ; sarve santu nirāmayāḥ',
          meaning: 'May all be happy. May all be free from illness.',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            const _SentenceHeader(),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final category in categories) ...[
                          _SentenceSectionLabel(
                            title: category.sanskritName,
                            subtitle:
                                '${category.name.toUpperCase()} · '
                                '${category.sentences.length} SENTENCES',
                          ),
                          const SizedBox(height: 12),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 1.05,
                                ),
                            itemCount: category.sentences.length,
                            itemBuilder: (context, index) => _SentenceTile(
                              number: category.sentences[index].id.substring(8),
                              sentence: category.sentences[index],
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            const BottomNav(currentIndex: 2),
          ],
        ),
      ),
    );
  }
}

class _SentenceHeader extends StatelessWidget {
  const _SentenceHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFCF5),
        border: Border(
          bottom: BorderSide(color: PracticeSentencesScreen.border),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: PracticeSentencesScreen.blue,
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
                'Practice Sentences',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: PracticeSentencesScreen.brown,
                ),
              ),
              Text(
                'Explore Sanskrit sentences.',
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
              color: PracticeSentencesScreen.brown,
            ),
          ),
        ],
      ),
    );
  }
}

class _SentenceSectionLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SentenceSectionLabel({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: PracticeSentencesScreen.brown,
          ),
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

class _SentenceTile extends StatelessWidget {
  final String number;
  final _Sentence sentence;

  const _SentenceTile({required this.number, required this.sentence});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: PracticeSentencesScreen.card,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => _SentenceDetailScreen(sentence: sentence),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: PracticeSentencesScreen.border),
            boxShadow: const [
              BoxShadow(
                color: Color(0x10000000),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Text(
                  number,
                  style: const TextStyle(
                    fontSize: 10,
                    color: PracticeSentencesScreen.gold,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sentence.sanskrit,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 22,
                        height: 1.35,
                        color: PracticeSentencesScreen.brown,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      sentence.transliteration,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF77716A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SentenceDetailScreen extends StatelessWidget {
  final _Sentence sentence;

  const _SentenceDetailScreen({required this.sentence});

  @override
  Widget build(BuildContext context) {
    final sanskritWords = sentence.sanskrit.split(RegExp(r'\s+'));
    final transliterationWords = sentence.transliteration.split(RegExp(r'\s+'));

    return Scaffold(
      backgroundColor: PracticeSentencesScreen.background,
      body: SafeArea(
        child: Column(
          children: [
            _SentenceDetailHeader(sentence: sentence),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                children: [
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 180),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: PracticeSentencesScreen.card,
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(color: PracticeSentencesScreen.border),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x10000000),
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sentence.sanskrit,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 38,
                            height: 1.3,
                            color: PracticeSentencesScreen.brown,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          sentence.transliteration,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            color: PracticeSentencesScreen.blue,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          sentence.meaning,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF77716A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 26),
                  const _SentenceSectionLabel(
                    title: 'शुद्ध उच्चारणम्',
                    subtitle: 'CORRECT PRONUNCIATION',
                  ),
                  const SizedBox(height: 12),
                  _SentenceAudioControl(
                    label: 'Listen — ${sentence.sanskrit}',
                    subtitle: 'Traditional articulation',
                    audioAsset: _sentenceAudio[sentence.id],
                  ),
                  const SizedBox(height: 24),
                  const _SentenceSectionLabel(
                    title: 'शब्दविभागः',
                    subtitle: 'WORD-BY-WORD READING',
                  ),
                  const SizedBox(height: 12),
                  ...sanskritWords.indexed.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: PracticeSentencesScreen.card,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: PracticeSentencesScreen.border,
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: const Color(0x18C79B45),
                              child: Text(
                                '${entry.$1 + 1}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: PracticeSentencesScreen.brown,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                entry.$2,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: PracticeSentencesScreen.brown,
                                ),
                              ),
                            ),
                            if (entry.$1 < transliterationWords.length)
                              Text(
                                transliterationWords[entry.$1],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF77716A),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SentenceAudioControl extends StatefulWidget {
  final String label;
  final String subtitle;
  final String? audioAsset;

  const _SentenceAudioControl({
    required this.label,
    required this.subtitle,
    this.audioAsset,
  });

  @override
  State<_SentenceAudioControl> createState() => _SentenceAudioControlState();
}

class _SentenceAudioControlState extends State<_SentenceAudioControl> {
  late final AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.onPlayerComplete.listen((_) {
      if (!mounted) return;
      setState(() {
        _isPlaying = false;
        _position = Duration.zero;
      });
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      if (!mounted) return;
      setState(() => _duration = duration);
    });

    _audioPlayer.onPositionChanged.listen((position) {
      if (!mounted) return;
      setState(() => _position = position);
    });

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() => _isPlaying = state == PlayerState.playing);
    });
  }

  Future<void> _toggle() async {
    final asset = widget.audioAsset;
    if (asset == null) return;

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else if (_position > Duration.zero && _position < _duration) {
        await _audioPlayer.resume();
      } else {
        await _audioPlayer.stop();
        await _audioPlayer.play(AssetSource(asset));
      }
    } catch (error) {
      if (!mounted) return;
      setState(() => _isPlaying = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not play this recording.')),
      );
      debugPrint('Sentence audio error: $error');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasAudio = widget.audioAsset != null;
    final progress = _duration.inMilliseconds == 0
        ? 0.0
        : (_position.inMilliseconds / _duration.inMilliseconds).clamp(0.0, 1.0);

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0x0AE7A13B),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: PracticeSentencesScreen.border),
      ),
      child: Row(
        children: [
          Material(
            color: PracticeSentencesScreen.blue,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: hasAudio ? _toggle : null,
              child: SizedBox(
                width: 46,
                height: 46,
                child: Icon(
                  !hasAudio
                      ? Icons.volume_off_rounded
                      : (_isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded),
                  color: Colors.white,
                  size: 29,
                ),
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: PracticeSentencesScreen.brown,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  !hasAudio
                      ? 'Recording not available yet'
                      : (_isPlaying ? 'Playing audio' : widget.subtitle),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF77716A),
                  ),
                ),
                const SizedBox(height: 7),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 5,
                  backgroundColor: const Color(0x22A89572),
                  color: PracticeSentencesScreen.gold,
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

class _SentenceDetailHeader extends StatelessWidget {
  final _Sentence sentence;

  const _SentenceDetailHeader({required this.sentence});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFCF5),
        border: Border(
          bottom: BorderSide(color: PracticeSentencesScreen.border),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            tooltip: 'Back to sentences',
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: PracticeSentencesScreen.brown,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              sentence.sanskrit,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: PracticeSentencesScreen.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
