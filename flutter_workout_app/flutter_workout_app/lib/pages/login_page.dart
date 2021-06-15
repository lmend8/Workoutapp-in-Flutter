import 'package:flutter/material.dart';
import 'package:flutter_workout_app/palatte/palatte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_workout_app/widget/background-image.dart';
import 'package:flutter_workout_app/widget/buttons.dart';
import 'package:flutter_workout_app/provider/googleButton.dart';
import 'package:flutter_workout_app/pages/signup_page.dart';

/// This is the login page. this is were we start the app. this
///

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

final textController = new TextEditingController();
final passwordController = new TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundImage(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
              children: [
                Image(image: AssetImage('assets/igitfitlogo.png')),
                // Container(
                //     height: 150,
                //     child: Center(child: Text('iGitFit', style: titleHeader))),
                SizedBox(
                  height: 0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          TextInput(
                            icon: CupertinoIcons.envelope,
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                          ),
                          PasswordInput(
                            icon: CupertinoIcons.lock,
                            hint: 'Password',
                            inputAction: TextInputAction.done,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          RoundedButton(
                            buttonText: 'Login',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: GoogleButton(),
                          ),
                          SizedBox(
                            height: 90,
                          ),
                          new Text(textController.text),
                          GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.white, width: 1))),
                                child: Text(
                                  'CreateNewAccount',
                                  style: emailBodyText,
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ));
                              }),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
          )),
    ]);
  }
}
