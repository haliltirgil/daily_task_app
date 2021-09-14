import 'package:flutter/material.dart';

Widget _showMaterialDialog(BuildContext context) {
  showDialog(
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
}

_dismissDialog(BuildContext context) {
  Navigator.pop(context);
}
