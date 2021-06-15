import 'package:flutter/material.dart';
import 'package:flutter_workout_app/pages/login_page.dart';
import 'package:flutter_workout_app/pages/register.dart';
import 'package:flutter_workout_app/palatte/palatte.dart';
import 'package:flutter_workout_app/pages/questioneer.dart';
import 'package:flutter_workout_app/provider/auth.dart';
import 'package:flutter_workout_app/pages/signup_page.dart';

// This class is for the rounden button on the sign-up page.
final formKeyTextSignUp = GlobalKey<FormState>();

final formkeyPasswordSignUp = GlobalKey<FormState>();

String _email = textController2.text;
String _password = passwordController2.text;
Authentication firebaseAuth = new Authentication();

class TextInput2 extends StatelessWidget {
  const TextInput2({
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
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[600].withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
              key: formKeyTextSignUp,
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
              controller: textController2,
              onSaved: (val) {
                textController2.text = val;
                formKeyTextSignUp.currentState.save();
              })),
    );
  }
}

class PasswordInput2 extends StatelessWidget {
  PasswordInput2({
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
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[600].withOpacity(0.8),
              borderRadius: BorderRadius.circular(16)),
          child: TextFormField(
              key: formkeyPasswordSignUp,
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
              controller: passwordController2,
              onChanged: (value) {
                _password = value.trim();
              },
              onSaved: (val) {
                passwordController2.text = val;
                formkeyPasswordSignUp.currentState.save();
              })),
    );
  }
}

class RoundedButton2 extends StatelessWidget {
  const RoundedButton2({
    Key key,
    @required this.buttonName,
  }) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.orangeAccent,
      ),
      child: FlatButton(
        onPressed: () {
          firebaseAuth.signUpUser(_email, _password);
          print(_email);
          print(_password);
          print("user created");
          textController2.clear();
          passwordController2.clear();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RegisterCompletePage(),
          ));
        },
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class RoundedButton3 extends StatelessWidget {
  const RoundedButton3({
    Key key,
    @required this.buttonName,
  }) : super(key: key);

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.orangeAccent,
      ),
      child: FlatButton(
        onPressed: () {
          firebaseAuth.signUpUser(_email, _password);
          print(_email);
          print(_password);
          print("user created");
          textController2.clear();
          passwordController2.clear();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
        },
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
