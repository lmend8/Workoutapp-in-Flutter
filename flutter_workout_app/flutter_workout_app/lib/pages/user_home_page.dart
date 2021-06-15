import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_workout_app/pages/stats_page.dart';
import 'package:flutter_workout_app/pages/settings_page.dart';
import 'package:flutter_workout_app/pages/schedule_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_workout_app/pages/login_page.dart';
import 'package:flutter_workout_app/widget/alert_dialog.dart';
import 'package:flutter_workout_app/widget/buttons.dart';
import 'package:flutter_workout_app/widget/quotes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// HomePage this is where we see all the buttons
/// when the user login in.
Future<Quote> quote = fetchQuote();

DefaultCacheManager manager = new DefaultCacheManager();

Future<Quote> fetchQuote() async {
  final response = await http.get('http://favqs.com/api/qotd');

  if (response.statusCode == 200) {
    return Quote.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Quote');
  }
}

class HomePage extends StatefulWidget {
  final String uid;

  HomePage({Key key, @required this.uid}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(uid);
}

final dayofweek = DateFormat.EEEE().format(DateTime.now());

class _HomePageState extends State<HomePage> {
  final String uid;

  _HomePageState(this.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 10, bottom: 20, right: 20, top: 550),
              margin: EdgeInsets.only(top: 219),
              constraints: BoxConstraints.expand(
                  height: MediaQuery.of(context).size.height - 219),
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
                              onPressed: () {},
                              backgroundColor: Colors.deepOrange,
                            ),
                          ),
                          Container(
                            key: Key('workout'),
                            height: 80,
                            width: 80,
                            child: FloatingActionButton(
                              heroTag: null,
                              child: Icon(Icons.line_weight_rounded),
                              onPressed: () {
                                manager.emptyCache();
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SchedulePage(),
                                ));
                              },
                              backgroundColor: Colors.deepOrange,
                            ),
                          ),
                          Container(
                            key: Key('Stats'),
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
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20, top: 90),
                height: 219,
                width: MediaQuery.of(context).size.width,
                child: Text("Welcome!",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 40,
                        color: Colors.black))),
            Container(
                padding: EdgeInsets.only(left: 20, top: 150),
                child: Text("Today is $dayofweek",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 25,
                        color: Colors.black))),
            Container(
                padding: EdgeInsets.only(left: 300, right: 30, top: 130),
                child: FlatButton(
                    key: Key('SignOut'),
                    child: Icon(Icons.logout),
                    onPressed: () async {
                      final action = await AlertDiaglogs.yesCancelDiaglog(
                          context, 'Logout', "are you sure ? ");
                      if (action == DialogsAction.yes) {
                        firebaseAuth.signOut();

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                      }
                    })),
            Container(
                padding: EdgeInsets.only(left: 120, right: 50, top: 360),
                child: Text("Hi $username",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black))),
            // Container(
            //     padding: EdgeInsets.only(left: 20, right: 30, top: 525),
            //     child: Text("BIO:",
            //         style: TextStyle(
            //           fontFamily: "Montserrat",
            //           fontSize: 25,
            //           color: Colors.black,
            //         ))),
            Container(
                padding: EdgeInsets.only(left: 60, right: 20, top: 350),
                child: FutureBuilder<Quote>(
                  future: quote,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SafeArea(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 0),
                            ),
                            Text(snapshot.data.quoteText,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 25)),
                            Text(snapshot.data.quoteAuthor),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                )),
            Container(
                padding: EdgeInsets.only(left: 150, right: 30, top: 240),
                child: CircleAvatar(
                    maxRadius: 50,
                    backgroundColor: Colors.brown.shade800,
                    child: Icon(FontAwesomeIcons.user,
                        color: Colors.orangeAccent, size: 20)))
          ],
        ),
      ),
    );
  }
}
