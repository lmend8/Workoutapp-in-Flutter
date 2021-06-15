import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:flutter_workout_app/provider/auth.dart';
import 'package:flutter_workout_app/pages/user_home_page.dart';

// Widget for the google button in the homepage.
class GoogleButton extends StatelessWidget {
  User user;
  // This widget is the root of your application.
  static Future<void> signInWithGoogle() async {
    await Authentication().signInWithGoogle();
  }

  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return SignInButton(
              buttonType: ButtonType.google,
              onPressed: () {
                signInWithGoogle().whenComplete(() async {
                  User user = FirebaseAuth.instance.currentUser;

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(uid: user.uid),
                  ));
                });
              });
        });
  }
}
