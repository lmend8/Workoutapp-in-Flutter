import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_workout_app/pages/user_home_page.dart';

final databaseReference = FirebaseDatabase.instance.reference();
DatabaseReference createUser() {
  var id = databaseReference.child('users/').push();
  //TODO: here is were we set all the value of the user.
}

Future<String> getUserName(user) async {
  String userUid = user.uid;
  print(userUid);
  String userName;

  DataSnapshot queryUserName = await databaseReference
      .child("users")
      .child(userUid)
      .child("username")
      .once()
      .then((DataSnapshot snap) {
    userName = snap.value;
  }) as DataSnapshot;

  print(userName);
  return json.encode(userName);
}

Future getWorkout(String workout) async {
  String workoutUrl;
  var id = databaseReference.child('exercises/').once();
  DataSnapshot queryWorkout = await databaseReference
      .child("exercises")
      .child(workout)
      .child("tutorial")
      .once()
      .then((DataSnapshot snap) {
    workoutUrl = snap.value;
  }) as DataSnapshot;

  return json.encode(workoutUrl);
  // TODO: here is were we going to implement the access of the workout.
}
