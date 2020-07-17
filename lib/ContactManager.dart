import 'dart:async';

List<String> CONTACTS = ["User 1", "User 2", "User 3", "User 4"];

class ContactManager {
  Stream<List<String>> get contactListNow async* {
    for (var i = 0; i < CONTACTS.length; i++) {
      await Future.delayed(Duration(seconds: 2));
//      THE `YIELD` KEYWORD PROVIDES AN ELEMENT FOR THE STREAM
      yield CONTACTS.sublist(0, i + 1);
    }
  }

  final StreamController<int> _contactCounter = StreamController<int>();
  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactListNow.listen((list) => _contactCounter.add(list.length));
  }
}