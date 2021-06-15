import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_workout_app/pages/login_page.dart';
import 'package:flutter_workout_app/pages/schedule_page.dart';
import 'package:flutter_workout_app/pages/stats_page.dart';
import 'package:flutter_workout_app/pages/user_home_page.dart';
import 'package:flutter_workout_app/widget/alert_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_workout_app/provider/auth.dart';

/// This is the settings page for the homepage
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

final dayofweek = DateFormat.EEEE().format(DateTime.now());
final auth = FirebaseAuth.instance;
String _email = textController.text;
String _password = passwordController.text;
LoginPage login = new LoginPage();

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 10, bottom: 20, right: 10, top: 620),
              margin: EdgeInsets.only(top: 130),
              constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height - 130),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.orangeAccent],
                    stops: [0.5, 1],
                    begin: const FractionalOffset(0.5, 0.2),
                    end: const FractionalOffset(1, 1),
                    // center: Alignment(0.0, 1),
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.orangeAccent,
                      blurRadius: 20.0,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 80,
                            width: 80,
                            child: FloatingActionButton(
                              heroTag: null,
                              child: Icon(Icons.person),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                              },
                              backgroundColor: Colors.deepOrange,
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            child: FloatingActionButton(
                              heroTag: null,
                              child: Icon(Icons.line_weight_rounded),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SchedulePage(),
                                ));
                              },
                              backgroundColor: Colors.deepOrange,
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            child: FloatingActionButton(
                              heroTag: null,
                              child: Icon(Icons.track_changes),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => StatsPage(),
                                ));
                              },
                              backgroundColor: Colors.deepOrange,
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            child: FloatingActionButton(
                              heroTag: null,
                              child: Icon(Icons.settings),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SettingsPage(),
                                ));
                              },
                              backgroundColor: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 110),
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.user,
                              color: Colors.orangeAccent, size: 20),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Account",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Divider(
                        height: 5,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      buildAccountOptionRow(context, "Change Password"),
                      buildAccountOptionRow(context, "Exercise Settings"),
                      buildAccountOptionRow(context, "User Data Settings"),
                      buildAccountOptionRow(context, "Language"),
                      buildAccountOptionRow(context, "Privacy and Security"),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(Icons.volume_up_outlined,
                              color: Colors.orangeAccent, size: 25),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Notifications",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Divider(
                        height: 15,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      buildNotificationOptionRow("Same Day Reminder", true),
                      buildNotificationOptionRow("New Week Schedule", true),
                      buildNotificationOptionRow("Missed Routine Alert", false),
                    ])),
            Container(
                padding: EdgeInsets.only(left: 20, top: 60),
                height: 219,
                width: MediaQuery.of(context).size.width,
                child: Text("Settings",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 40,
                        color: Colors.black))),
            Container(
                padding: EdgeInsets.only(left: 300, right: 30, top: 70),
                child: FlatButton(
                    child: Icon(Icons.logout),
                    onPressed: () async {
                      final action = await AlertDiaglogs.yesCancelDiaglog(
                          context, 'Logout', "are you sure ? ");
                      if (action == DialogsAction.yes) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                      }
                    })),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              trackColor: Colors.red,
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
