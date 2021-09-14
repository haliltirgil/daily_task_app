import 'package:flutter/material.dart';

class TaskDialog extends StatefulWidget {
  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
    );
  }
}

/* _dismissDialog(BuildContext context) {
  Navigator.pop(context);
} */

/* showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Material Dialog'),
            content: Text('Hey! I am Coflutter!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog(context);
                  },
                  child: Text('Close')),
              TextButton(
                onPressed: () {
                  print('HelloWorld!');
                  _dismissDialog(context);
                },
                child: Text('HelloWorld!'),
              )
            ],
          );
        });
  } */