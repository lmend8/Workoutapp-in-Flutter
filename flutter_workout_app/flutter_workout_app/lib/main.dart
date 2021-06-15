import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_workout_app/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_workout_app/pages/stats_page.dart';

// main program to run the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IGitFit',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
