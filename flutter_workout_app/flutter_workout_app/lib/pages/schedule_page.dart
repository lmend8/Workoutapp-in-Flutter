import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workout_app/pages/login_page.dart';
import 'package:flutter_workout_app/pages/user_home_page.dart';
import 'package:flutter_workout_app/pages/stats_page.dart';
import 'package:flutter_workout_app/pages/settings_page.dart';
import 'package:flutter_workout_app/widget/alert_dialog.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// This is where we show the schedule for the work out app
/// TODO: implement a better schedule maybe create more widget
///

String url = "https://www.youtube.com/watch?v=D1wEFL3oFHM";
String url2 = "https://www.youtube.com/watch?v=qwx1VV9vV1A";

String videoId = YoutubePlayer.convertUrlToId(url);

String videoId2 = YoutubePlayer.convertUrlToId(url2);

YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: videoId,
  flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      isLive: false,
      disableDragSeek: false,
      enableCaption: false,
      forceHD: false),
);

YoutubePlayerController _controller2 = YoutubePlayerController(
  initialVideoId: videoId2,
  flags: const YoutubePlayerFlags(
    autoPlay: false,
    mute: false,
    isLive: false,
    disableDragSeek: false,
    enableCaption: false,
    forceHD: false,
  ),
);

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

//final dayofweek = DateFormat.EEEE().format(DateTime.now());
final auth = FirebaseAuth.instance;
String _email = textController.text;
String _password = passwordController.text;
LoginPage login = new LoginPage();

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 10, bottom: 20, right: 20, top: 620),
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
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20, top: 60),
                height: 219,
                width: MediaQuery.of(context).size.width,
                child: Text("Schedule",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 40,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold))),
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
            Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 170),
                child: Text("BENCH   REPS: 3  ",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            Container(
                padding: EdgeInsets.only(left: 33, top: 180),
                width: MediaQuery.of(context).size.width / 1.2,
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      )
                      // )
                    ])),
            Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 430),
                child: Text("CHEST   REPS: 10  ",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            Container(
                padding: EdgeInsets.only(left: 33, top: 440),
                width: MediaQuery.of(context).size.width / 1.2,
                child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      YoutubePlayer(
                        controller: _controller2,
                        showVideoProgressIndicator: true,
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}

void choiceAction(String choice) {
  print("Working");
}

const List<String> choices = <String>[
  "Version",
  "signOut",
];
