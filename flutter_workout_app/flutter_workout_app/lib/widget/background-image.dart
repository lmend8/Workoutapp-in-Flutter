import 'package:flutter/material.dart';

// Background image for the login page.
class BackgroundImage extends StatelessWidget {
  @override
  const BackgroundImage({
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/workout-image1.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken))),
    );
  }
}
