import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:spaceword/constants/styles.dart';
import 'package:spaceword/page/character_customization_page.dart';
import 'package:spaceword/page/welcome_page.dart';
import 'package:spaceword/provider.dart';
import 'package:spaceword/ui/level_button.dart';
import 'package:spaceword/page/level_page.dart';

class ChooseLevelPage extends StatelessWidget {
  const ChooseLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              IconData(0xf02db, fontFamily: 'MaterialIcons'),
              color: brandColorYellow,
              size: 50,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WelcomePage()),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Consumer<CoinProvider>(
                builder: (context, coinProvider, child) {
                  return Row(
                    children: [
                      Text(
                        '${coinProvider.coins}', // Display current coin count
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.monetization_on,
                          color: brandColorYellow,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: gradient_2,
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // kolom jadi vertical
              children: [
                const SizedBox(height: 80), // jarak atas layar dan tombol
                SizedBox(
                  width: 200,
                  child: LevelButton(
                    color: brandColorGreen,
                    text: 'EASY',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LevelPage(
                                  type: LevelType.easy,
                                  bgImage: 'assets/image/1.png')));
                    },
                  ),
                ),
                const SizedBox(height: 35),

                SizedBox(
                  width: 200,
                  child: LevelButton(
                    color: brandColorYellow,
                    text: 'MEDIUM',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LevelPage(
                                  type: LevelType.medium,
                                  bgImage: 'assets/image/1.png')));
                    },
                  ),
                ),
                const SizedBox(height: 35),

                SizedBox(
                  width: 200,
                  child: LevelButton(
                    color: brandColorRed,
                    text: 'HARD',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LevelPage(
                                  type: LevelType.hard,
                                  bgImage: 'assets/image/1.png')));
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        IconData(0xef4c, fontFamily: 'MaterialIcons'),
                        color: brandColorYellow,
                        size: 50,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CharacterCustomizationPage()),
                        );
                      },
                    ),
                    const Text(
                      'CUSTOM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
