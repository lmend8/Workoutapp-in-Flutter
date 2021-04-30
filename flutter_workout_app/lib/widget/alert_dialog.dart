import 'package:flutter/material.dart';

enum DialogsAction { yes, cancel }

class AlertDiaglogs {
  static Future<DialogsAction> yesCancelDiaglog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(title),
              content: Text(body),
              actions: <Widget>[
                FlatButton(
                  onPressed: () =>
                      Navigator.of(context).pop(DialogsAction.cancel),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(DialogsAction.yes),
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.redAccent, fontWeight: FontWeight.w700),
                  ),
                )
              ]);
        });
    return (action != null) ? action : DialogsAction.cancel;
  }
}
