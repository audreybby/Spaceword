import 'package:flutter/material.dart';

import 'package:spaceword/constants/styles.dart';
import 'package:spaceword/page/choose_level_page.dart';
import 'package:spaceword/ui/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _BackgroundImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TitleText(),
                SizedBox(height: 55),
                StartButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/Background Galaxy.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Spaceword',
      style: welcomeTextStyle,
      textAlign: TextAlign.center,
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Start',
      color: customButtonColor,
      bgColor: customButtonBgColor,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChooseLevelPage()),
        );
      },
    );
  }
}
