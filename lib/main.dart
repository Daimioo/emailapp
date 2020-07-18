import 'package:emailapp/App.dart';
import 'package:flutter/material.dart';

import 'ContactManager.dart';
import 'Provider.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: ContactManager(),
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
