import 'dart:async';
import 'model/Contact.dart';
import 'package:emailapp/service/ContactService.dart';

class ContactManager {
  Stream<List<Contact>> get contactListNow async* {
    yield await ContactService.browse();
  }

  final StreamController<int> _contactCounter = StreamController<int>();
  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactListNow.listen((list) => _contactCounter.add(list.length));
  }
}