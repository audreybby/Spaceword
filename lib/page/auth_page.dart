import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24.0, 96.0, 24.0, 24.0),
        children: [
          Column(
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 24.0),
              // SupaEmailAuth(
              //   redirectTo: kIsWeb ? null : "myapptest://com.example.spaceword",
              //   onSignInComplete: (res) =>
              //       Navigator.pushNamed(context, '/home'),
              //   onSignUpComplete: (res) =>
              //       Navigator.pushNamed(context, '/home'),
              //   onError: (error) => SnackBar(content: Text(error.toString())),
              // ),
              SupaSocialsAuth(
                socialProviders: const [
                  OAuthProvider.google,
                ],
                redirectUrl:
                    kIsWeb ? null : "myapptest://com.example.spaceword",
                nativeGoogleAuthConfig: NativeGoogleAuthConfig(
                    // iosClientId: dotenv.env['IOS_CLIENT_ID']!,
                    webClientId: dotenv.env['WEB_CLIENT_ID']!),
                onSuccess: (session) => Navigator.pushNamed(
                  context,
                  '/home',
                ),
                onError: (error) => SnackBar(
                  content: Text(
                    error.toString(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
