import 'package:emailapp/App.dart';
import 'package:flutter/material.dart';

void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.red
      ),
      home: App(),
    );
  }
}
