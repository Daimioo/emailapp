import 'ContactManager.dart';
import 'manager/MessageFormManager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};

  Overseer() {
    register(ContactManager, ContactManager());
    register(MessageFormManager, MessageFormManager());
  }

  register(name, object) {
    repository[name] = object;
  }

  fetch(name) => repository[name];
}