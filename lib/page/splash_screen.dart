import 'dart:async';

import 'package:flutter/material.dart';

import 'package:spaceword/constants/styles.dart';
import 'package:spaceword/page/welcome_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate after a delay
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      );
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: gradient_1,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Splash screen logo
              Image.asset(
                'assets/image/LOGO GEM DEV REVISI.png',
                width: 170,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
