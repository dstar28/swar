import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/learn_screen.dart';
import '../screens/practice_screen.dart';
import '../screens/progress_screen.dart';
import '../screens/profile_screen.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({super.key, required this.currentIndex});

  void _openDestination(BuildContext context, int index) {
    if (index == currentIndex) {
      return;
    }

    Widget destination;

    switch (index) {
      case 0:
        destination = const HomeScreen();
        break;

      case 1:
        destination = const LearnScreen();
        break;

      case 2:
        destination = const PracticeScreen();
        break;

      case 3:
        destination = const ProgressScreen();
        break;

      case 4:
        destination = const ProfileScreen();
        break;

      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );
  }

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
        border: Border(top: BorderSide(color: Color(0xFFE7DECD))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.indexed.map((entry) {
          final index = entry.$1;
          final item = entry.$2;
          final selected = index == currentIndex;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () => _openDestination(context, index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 3,
                  ),
                  child: Icon(
                    item.$1,
                    size: 22,
                    color: selected
                        ? const Color(0xFF354A82)
                        : const Color(0xFF776B5D),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              Text(
                item.$2,
                style: TextStyle(
                  fontSize: 10,
                  color: selected
                      ? const Color(0xFF354A82)
                      : const Color(0xFF776B5D),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
