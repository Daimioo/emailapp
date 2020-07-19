import 'package:emailapp/App.dart';
import 'package:flutter/material.dart';
import 'package:sprinkle/Overseer.dart';
import 'package:sprinkle/Provider.dart';

import 'ContactManager.dart';
import 'manager/MessageFormManager.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer({
        ContactManager: () => ContactManager(),
        MessageFormManager: () => MessageFormManager()
      }),
      child: MaterialApp(
        title: 'Email App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.red
        ),
        home: App(),
      ),
    );
  }
}
