import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar")
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text("Calendar"),
      ),
    );
  }
}
