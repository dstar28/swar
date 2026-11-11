import 'package:flutter/material.dart';

import '../widgets/bottom_nav.dart';

class _Sentence {
  final String sanskrit;
  final String transliteration;
  final String meaning;
  final List<(String, String)> words;
  final String tip;

  const _Sentence({
    required this.sanskrit,
    required this.transliteration,
    required this.meaning,
    required this.words,
    required this.tip,
  });
}

class PracticeSentencesScreen extends StatelessWidget {
  const PracticeSentencesScreen({super.key});

  static const background = Color(0xFFFAF7EF);
  static const card = Color(0xFFFFFDF8);
  static const brown = Color(0xFF4D4033);
  static const blue = Color(0xFF354A82);
  static const gold = Color(0xFFC79B45);
  static const border = Color(0xFFE7DECD);

  static const sentences = [
    _Sentence(
      sanskrit: 'नमस्ते।',
      transliteration: 'namaste',
      meaning: 'Hello.',
      words: [('नमस्ते', 'hello')],
      tip: 'Say “na-ma-ste” smoothly, keeping each syllable clear.',
    ),
    _Sentence(
      sanskrit: 'मम नाम रामः।',
      transliteration: 'mama nāma rāmaḥ',
      meaning: 'My name is Rama.',
      words: [('मम', 'my'), ('नाम', 'name'), ('रामः', 'Rama')],
      tip: 'Pause slightly after “मम” and pronounce each word evenly.',
    ),
    _Sentence(
      sanskrit: 'अहं छात्रः अस्मि।',
      transliteration: 'ahaṃ chātraḥ asmi',
      meaning: 'I am a student.',
      words: [('अहम्', 'I'), ('छात्रः', 'student'), ('अस्मि', 'am')],
      tip: 'Give “छ” a clear breath and pronounce each word distinctly.',
    ),
    _Sentence(
      sanskrit: 'भवान् कथम् अस्ति?',
      transliteration: 'bhavān katham asti',
      meaning: 'How are you?',
      words: [('भवान्', 'you (formal)'), ('कथम्', 'how'), ('अस्ति', 'are')],
      tip:
          'Keep the question flowing and raise your voice slightly at the end.',
    ),
    _Sentence(
      sanskrit: 'अहं जलं पिबामि।',
      transliteration: 'ahaṃ jalaṃ pibāmi',
      meaning: 'I drink water.',
      words: [('अहम्', 'I'), ('जलम्', 'water'), ('पिबामि', 'drink')],
      tip:
          'Pronounce each word distinctly and keep the final vowel in “पिबामि”.',
    ),
    _Sentence(
      sanskrit: 'बालकः पुस्तकं पठति।',
      transliteration: 'bālakaḥ pustakaṃ paṭhati',
      meaning: 'The boy reads a book.',
      words: [('बालकः', 'boy'), ('पुस्तकम्', 'book'), ('पठति', 'reads')],
      tip: 'Say “पुस्तकम्” in three clear beats: pus-ta-kam.',
    ),
    _Sentence(
      sanskrit: 'बालिका पत्रं लिखति।',
      transliteration: 'bālikā patraṃ likhati',
      meaning: 'The girl writes a letter.',
      words: [('बालिका', 'girl'), ('पत्रम्', 'letter'), ('लिखति', 'writes')],
      tip: 'Hold the long “आ” in “बालिका” and finish “लिखति” clearly.',
    ),
    _Sentence(
      sanskrit: 'वयं संस्कृतं पठामः।',
      transliteration: 'vayaṃ saṃskṛtaṃ paṭhāmaḥ',
      meaning: 'We study Sanskrit.',
      words: [('वयम्', 'we'), ('संस्कृतम्', 'Sanskrit'), ('पठामः', 'study')],
      tip:
          'Keep “संस्कृतम्” connected and give the aspirated “ठ” a clear breath.',
    ),
    _Sentence(
      sanskrit: 'सूर्यः उदेति।',
      transliteration: 'sūryaḥ udeti',
      meaning: 'The sun rises.',
      words: [('सूर्यः', 'sun'), ('उदेति', 'rises')],
      tip: 'Hold the long “ऊ” in “सूर्यः” before saying “उदेति”.',
    ),
    _Sentence(
      sanskrit: 'पक्षिणः आकाशे उड्डयन्ति।',
      transliteration: 'pakṣiṇaḥ ākāśe uḍḍayanti',
      meaning: 'Birds fly in the sky.',
      words: [
        ('पक्षिणः', 'birds'),
        ('आकाशे', 'in the sky'),
        ('उड्डयन्ति', 'fly'),
      ],
      tip: 'Break the sentence into three parts, then say it continuously.',
    ),
    _Sentence(
      sanskrit: 'फलानि मधुराणि सन्ति।',
      transliteration: 'phalāni madhurāṇi santi',
      meaning: 'The fruits are sweet.',
      words: [('फलानि', 'fruits'), ('मधुराणि', 'sweet'), ('सन्ति', 'are')],
      tip: 'Keep the long vowels in “मधुराणि” clear and steady.',
    ),
    _Sentence(
      sanskrit: 'धन्यवादः।',
      transliteration: 'dhanyavādaḥ',
      meaning: 'Thank you.',
      words: [('धन्यवादः', 'thank you')],
      tip: 'Say “धन्यवादः” slowly and finish with a soft breath.',
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SentenceSectionLabel(
                      title: 'वाक्यानि',
                      subtitle: 'SANSKRIT SENTENCES · 12 SENTENCES',
                    ),
                    const SizedBox(height: 12),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.92,
                          ),
                      itemCount: sentences.length,
                      itemBuilder: (context, index) => _SentenceTile(
                        number: index + 1,
                        sentence: sentences[index],
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
  final int number;
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
                  '$number',
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
                  ),
                  const SizedBox(height: 24),
                  const _SentenceSectionLabel(
                    title: 'शब्दार्थः',
                    subtitle: 'WORD-BY-WORD MEANING',
                  ),
                  const SizedBox(height: 12),
                  ...sentence.words.indexed.map(
                    (entry) => Padding(
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
                                entry.$2.$1,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: PracticeSentencesScreen.brown,
                                ),
                              ),
                            ),
                            Text(
                              entry.$2.$2,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF77716A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0x14E7A13B),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0x66C79B45)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.lightbulb_outline_rounded,
                          color: PracticeSentencesScreen.gold,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            sentence.tip,
                            style: const TextStyle(
                              fontSize: 13,
                              height: 1.4,
                              color: PracticeSentencesScreen.brown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

class _SentenceAudioControl extends StatefulWidget {
  final String label;
  final String subtitle;

  const _SentenceAudioControl({required this.label, required this.subtitle});

  @override
  State<_SentenceAudioControl> createState() => _SentenceAudioControlState();
}

class _SentenceAudioControlState extends State<_SentenceAudioControl>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed && mounted) {
              setState(() => _isPlaying = false);
            }
          });
  }

  void _toggle() {
    if (_isPlaying) {
      _controller.stop();
      setState(() => _isPlaying = false);
      return;
    }
    if (_controller.isCompleted) {
      _controller.value = 0;
    }
    setState(() => _isPlaying = true);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Container(
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
                onTap: _toggle,
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: Icon(
                    _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
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
                    _isPlaying
                        ? 'Audio preview · add recording later'
                        : widget.subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF77716A),
                    ),
                  ),
                  const SizedBox(height: 7),
                  LinearProgressIndicator(
                    value: _controller.value,
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
      ),
    );
  }
}
