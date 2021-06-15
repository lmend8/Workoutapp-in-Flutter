import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_workout_app/widget/buttons.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_workout_app/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("no user", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailFormField = find.byType(TextInput).first;
      final passwordFormField = find.byType(PasswordInput).first;
      final loginButton = find.byType(RoundedButton).first;

      await tester.enterText(emailFormField, "notuser@me.com");
      await tester.enterText(passwordFormField, "123456");
      await tester.pumpAndSettle();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 15));
    });

    testWidgets("logout button", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailFormField = find.byType(TextInput).first;
      final passwordFormField = find.byType(PasswordInput).first;
      final loginButton = find.byType(RoundedButton).first;

      final logout = find.byKey(Key('SignOut')).first;
      final confirm = find.text("Confirm");

      await tester.enterText(emailFormField, "alex@me.com");
      await tester.enterText(passwordFormField, "123456");
      await tester.pumpAndSettle();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 20));
      await tester.pumpAndSettle();
      await tester.tap(logout);
      await Future.delayed(Duration(seconds: 15));
      await tester.pumpAndSettle();
      await tester.tap(confirm);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 20));
      await tester.pumpAndSettle();
    });

    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailFormField = find.byType(TextInput).first;
      final passwordFormField = find.byType(PasswordInput).first;
      final loginButton = find.byType(RoundedButton).first;

      final settingsButton = find.byType(FloatingActionButton).last;
      final profileButton = find.byType(FloatingActionButton).first;
      final trackerButton = find.byKey(Key("Stats"));
      final scheduleButton = find.byKey(Key("workout"));

      await tester.enterText(emailFormField, "alex@me.com");
      await tester.enterText(passwordFormField, "123456");
      await tester.pumpAndSettle();

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 25));
      await tester.pumpAndSettle();
      await tester.tap(settingsButton);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 10));
      await tester.pumpAndSettle();
      await tester.tap(profileButton);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 10));
      await tester.pumpAndSettle();
      await tester.tap(trackerButton);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 10));
      await tester.pumpAndSettle();
      await tester.tap(scheduleButton);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 15));
      await tester.pumpAndSettle();
    });
  });
}
