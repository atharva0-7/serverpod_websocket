
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:websocket_example_flutter/screens/user_list_screen.dart';
import '../core/auth_service.dart';

class SignInScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  SignInScreen({super.key});


  void _handleSignIn(BuildContext context) async {
    User? firebaseUser = await _authService.signInWithGoogle();
    if (firebaseUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UserListScreen(currentUser: firebaseUser),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _handleSignIn(context),
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}