import 'package:flutter/material.dart';
import 'package:flutter_workout_app/Database/database.dart';
import 'package:flutter_workout_app/pages/login_page.dart';
import 'package:flutter_workout_app/pages/user_home_page.dart';

import 'package:flutter_workout_app/palatte/palatte.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_workout_app/provider/auth.dart';
// button class

final formKeyText = GlobalKey<FormState>();

final formkeyPassword = GlobalKey<FormState>();

String username;
// void getLocalUserName() async {
//   username = await getUserName(user);
//   print(username);
// }

final auth = FirebaseAuth.instance;
// ignore: unused_element
String _email = textController.text;
String _password = passwordController.text;
Authentication firebaseAuth = new Authentication();
LoginPage login = new LoginPage();

class TextInput extends StatelessWidget {
  const TextInput({
    Key key,
    @required this.icon,
    @required this.hint,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[600].withOpacity(0.8),
              borderRadius: BorderRadius.circular(16)),
          child: TextFormField(
              key: Key("formKeyText"),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: hint,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  hintStyle: emailBodyText),
              style: emailBodyText,
              keyboardType: inputType,
              textInputAction: inputAction,
              onChanged: (value) {
                _email = value.trim();
              },
              controller: textController,
              onSaved: (val) {
                textController.text = val;
                formKeyText.currentState.save();
              })),
    );
  }
}

class PasswordInput extends StatelessWidget {
  PasswordInput({
    Key key,
    @required this.icon,
    @required this.hint,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[600].withOpacity(0.8),
              borderRadius: BorderRadius.circular(16)),
          child: TextFormField(
              key: Key("formkeyPassword"),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: hint,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  hintStyle: emailBodyText),
              obscureText: true,
              style: emailBodyText,
              textInputAction: inputAction,
              controller: passwordController,
              onChanged: (value) {
                _password = value.trim();
              },
              onSaved: (val) {
                passwordController.text = val;
                formkeyPassword.currentState.save();
              })),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.buttonText,
  }) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(16)),
        child: FlatButton(
          onPressed: () async {
            User user = await firebaseAuth.signInWithEmailandPassword(
                _email, _password);
            if (user != null) {
              username = await getUserName(user);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(uid: user.uid),
              ));
              textController.clear();
              passwordController.clear();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              buttonText,
              style: emailBodyText,
            ),
          ),
        ));
  }
}
