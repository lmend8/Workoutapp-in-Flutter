import 'package:flutter/material.dart';
import 'package:flutter_workout_app/widget/rounded-button2.dart';
import 'package:flutter_workout_app/widget/text-field-input.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_workout_app/widget/background-image.dart';
import 'package:flutter_workout_app/palatte/palatte.dart';

// This page will show up once the user create a new account

class RegisterCompletePage extends StatefulWidget {
  @override
  _RegisterCompleteState createState() => new _RegisterCompleteState();
}

class _RegisterCompleteState extends State<RegisterCompletePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Container(
          padding: EdgeInsets.only(left: 80, bottom: 20, right: 90, top: 550),
          child: RoundedButton3(buttonName: 'Back to login'),
        ),
        Container(
            padding:
                EdgeInsets.only(left: 100, bottom: 20, right: 90, top: 420),
            child: Text(
              "User Created",
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
