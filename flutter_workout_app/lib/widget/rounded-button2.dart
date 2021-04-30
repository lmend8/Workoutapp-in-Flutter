import 'package:flutter/material.dart';
import 'package:flutter_workout_app/palatte/palatte.dart';
import 'package:flutter_workout_app/pages/questioneer.dart';

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
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => QuestioneerPage(),
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
