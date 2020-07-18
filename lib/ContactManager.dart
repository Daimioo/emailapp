import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'model/Contact.dart';
import 'package:emailapp/service/ContactService.dart';

class ContactManager {
  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();
  Stream<int> get contactCounter => _contactCounter.stream;

  Stream<List<Contact>> get contactListView => Stream.fromFuture(ContactService.browse());

  Stream<List<Contact>> filteredCollection({query}) =>
      Stream.fromFuture(ContactService.browse(query: query));

  ContactManager() {
    contactListView.listen((list) => _contactCounter.add(list.length));
  }
}