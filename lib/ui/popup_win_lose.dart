import 'package:flutter/material.dart';

import 'package:spaceword/page/character_customization_page.dart';
import 'package:spaceword/page/choose_level_page.dart';
import 'package:spaceword/page/welcome_page.dart';

enum PopupType { win, lose }

class PopupWinLose extends StatefulWidget {
  final int score;
  final PopupType type;

  const PopupWinLose({
    super.key,
    required this.score,
    required this.type,
  });

  @override
  _PopupState createState() => _PopupState();
}

class _PopupState extends State<PopupWinLose>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            _popupBackground(),
            _banner(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Widget _popupBackground() {
    return Container(
      width: 300,
      height: 320,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 227, 255),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 140, color: Colors.black),
          const SizedBox(height: 8),
          const Text(
            "Username",
            style: TextStyle(
              fontSize: 25,
              color: Colors.purple,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Score: ${widget.score}",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.purple,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _banner() {
    String bannerText = widget.type == PopupType.win ? "WIN" : "LOSE";
    Color bannerColor =
        widget.type == PopupType.win ? Colors.green : Colors.red;

    return Positioned(
      top: -30,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: bannerColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          bannerText,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  Widget _buttons() {
    return Positioned(
      bottom: -25,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            icon: Icons.checkroom,
            onPressed: () =>
                _navigateTo(context, const CharacterCustomizationPage()),
          ),
          const SizedBox(width: 8),
          _buildButton(
            text: widget.type == PopupType.win ? "PLAY AGAIN" : "RETRY",
            onPressed: () => _navigateTo(context, const ChooseLevelPage()),
          ),
          const SizedBox(width: 8),
          _buildButton(
            icon: Icons.home,
            onPressed: () => _navigateTo(context, const WelcomePage()),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    String? text,
    IconData? icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: const Color.fromARGB(255, 156, 39, 176),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: text != null
          ? Text(
              text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )
          : Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
