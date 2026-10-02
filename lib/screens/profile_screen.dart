import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool darkMode = false;

  static const bg = Color(0xFFFAF7EF);
  static const card = Color(0xFFFFFDF8);
  static const blue = Color(0xFF354A82);
  static const brown = Color(0xFF4D4033);
  static const gold = Color(0xFFE7A13B);
  static const border = Color(0xFFE7DECD);

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
              const Text(
                'परिचयः',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: brown,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Your learner profile',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              _profileCard(),

              const SizedBox(height: 12),

              Row(
                children: const [
                  Expanded(
                    child: _MiniStat(value: '87%', label: 'Accuracy'),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _MiniStat(value: '126', label: 'Words mastered'),
                  ),
                ],
              ),

              const _SectionHeader(
                deva: 'मम लक्ष्याणि',
                english: 'My learning goals',
              ),

              _goals(),

              const _SectionHeader(
                deva: 'प्रमाणपत्राणि',
                english: 'Certificates',
              ),

              _certificates(),

              const _SectionHeader(deva: 'उपलब्धयः', english: 'Badges earned'),

              _badges(),

              const SizedBox(height: 28),

              const Divider(color: border),

              const SizedBox(height: 5),

              const _SectionHeader(deva: 'सेटिंग्स', english: 'Settings'),

              _settings(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 4),
    );
  }

  Widget _profileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: blue,
            ),
            child: const Text(
              'श्रु',
              style: TextStyle(fontSize: 29, color: gold),
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shruti',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: brown,
                  ),
                ),

                SizedBox(height: 3),

                Text('मध्यम साधक', style: TextStyle(fontSize: 14, color: blue)),

                SizedBox(height: 3),

                Text(
                  'Intermediate Learner · since March 2026',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),

                SizedBox(height: 6),

                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      size: 15,
                      color: Color(0xFFB85C45),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '7 day streak',
                      style: TextStyle(fontSize: 11, color: Color(0xFFB85C45)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _goals() {
    const goals = [
      ['Conversational Sanskrit', 42],
      ['Shloka pronunciation', 68],
      ['Sanskrit reading', 55],
      ['Vedic pronunciation', 21],
    ];

    return _CardContainer(
      child: Column(
        children: goals.map((goal) {
          final progress = goal[1] as int;

          return Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      goal[0] as String,
                      style: const TextStyle(fontSize: 13, color: brown),
                    ),
                    Text(
                      '$progress%',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress / 100,
                    minHeight: 8,
                    backgroundColor: border,
                    color: gold,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _certificates() {
    const certificates = [
      ['स्वर परिचयः', 'Vowel Foundations', 'May 2026'],
      ['व्यञ्जन अभ्यासः', 'Consonant Practice', 'July 2026'],
    ];

    return Column(
      children: certificates.map((certificate) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: card,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0x66E7A13B)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0x18E7A13B),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.workspace_premium_outlined,
                  color: gold,
                  size: 21,
                ),
              ),

              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certificate[0],
                    style: const TextStyle(fontSize: 17, color: brown),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${certificate[1]} · ${certificate[2]}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _badges() {
    const badges = [
      ['🏆', 'प्रथम स्वरः'],
      ['🔥', 'अभ्यास योगी'],
      ['🎙️', 'शुद्ध वाणी'],
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: badges.map((badge) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
          decoration: BoxDecoration(
            color: const Color(0x18E7A13B),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color(0x66E7A13B)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(badge[0], style: const TextStyle(fontSize: 15)),
              const SizedBox(width: 7),
              Text(
                badge[1],
                style: const TextStyle(fontSize: 12, color: brown),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _settings() {
    return Container(
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          const _SettingRow(
            icon: Icons.notifications_none,
            label: 'Notifications',
            value: 'Daily at 7:00',
          ),

          const _SettingRow(
            icon: Icons.volume_up_outlined,
            label: 'Audio settings',
            value: 'Slow playback',
          ),

          const _SettingRow(
            icon: Icons.language,
            label: 'Language',
            value: 'English + संस्कृतम्',
          ),

          _SettingRow(
            icon: Icons.dark_mode_outlined,
            label: 'Dark mode',
            value: '',
            trailing: Switch(
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
              activeThumbColor: gold,
            ),
          ),

          const _SettingRow(
            icon: Icons.accessibility_new,
            label: 'Accessibility',
            value: 'Large text · captions on',
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String value;
  final String label;

  const _MiniStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE7DECD)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4D4033),
            ),
          ),
          const SizedBox(height: 3),
          Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}

class _CardContainer extends StatelessWidget {
  final Widget child;

  const _CardContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE7DECD)),
      ),
      child: child,
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

class _SettingRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Widget? trailing;

  const _SettingRow({
    required this.icon,
    required this.label,
    required this.value,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE7DECD))),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F0E8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 18, color: Colors.grey),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Color(0xFF4D4033)),
            ),
          ),

          if (trailing != null)
            trailing!
          else
            Text(
              value,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}
