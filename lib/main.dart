import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:spaceword/page/auth_page.dart';
import 'package:spaceword/page/choose_level_page.dart';
import 'package:spaceword/page/welcome_page.dart';
import 'package:spaceword/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // load env
  await dotenv.load();
  // initialize supabase
  String sbUrl = dotenv.env['SUPABASE_URL'] ?? '';
  String sbKey = dotenv.env['SUPABASE_KEY'] ?? '';
  await Supabase.initialize(url: sbUrl, anonKey: sbKey);

  runApp(
    // TODO: remove provider, use supabase
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoinProvider()),
        ChangeNotifierProvider(create: (context) => CharacterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spaceword',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // home: const SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/auth': (context) => const AuthPage(),
        '/home': (context) => const ChooseLevelPage(),
      },
    );
  }
}
