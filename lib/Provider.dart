import 'package:flutter/material.dart';

import 'ContactManager.dart';

class Provider<T> extends InheritedWidget {
  final T data;

  Provider({Key key, Widget child, this.data}) : super(key: key, child: child);

  static T of<T>(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider<T>>()).data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
