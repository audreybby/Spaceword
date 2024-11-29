import 'package:flutter/material.dart';

import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import 'package:spaceword/constants/styles.dart';
import 'package:spaceword/page/auth_page.dart';
import 'package:spaceword/page/character_customization_page.dart';
import 'package:spaceword/page/choose_level_page.dart';
import 'package:spaceword/ui/custom_button.dart';

final activeSession = Supabase.instance.client.auth.currentSession;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // if (activeSession == null) {
    //   Navigator.pushNamed(context, '/auth');
    // }
  }

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
                SizedBox(height: 54),
                StartButton(),
                SizedBox(height: 12),
                LoginButton(),
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

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text:
          activeSession == null ? 'not signed in' : '${activeSession?.user.id}',
      color: Colors.black,
      bgColor: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => activeSession == null
                  ? const AuthPage()
                  : const CharacterCustomizationPage()),
        );
      },
    );
  }
}
