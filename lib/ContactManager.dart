import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'model/Contact.dart';
import 'package:emailapp/service/ContactService.dart';

class ContactManager {
  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();

  Stream<int> get count$  => _contactCounter.stream;
  Stream<List<Contact>> browse$({String query}) =>
      Stream.fromFuture(ContactService.browse(query: query));

  ContactManager() {
    browse$().listen((list) => _contactCounter.add(list.length));
  }
}