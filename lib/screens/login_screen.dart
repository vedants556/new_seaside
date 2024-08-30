import 'package:flutter/material.dart';
import 'package:coastal_tourism_app/services/google_sign_in_service.dart';

class LoginScreen extends StatelessWidget {
  final GoogleSignInService _googleSignInService = GoogleSignInService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign in with Google'),
          onPressed: () async {
            final user = await _googleSignInService.signInWithGoogle();
            if (user != null) {
              // Navigate to home screen or perform other actions
              print('Signed in: ${user.user?.displayName}');
            }
          },
        ),
      ),
    );
  }
}