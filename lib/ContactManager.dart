import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'model/Contact.dart';
import 'package:emailapp/service/ContactService.dart';

class ContactManager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final PublishSubject<int> _countSubject = PublishSubject<int>();
  final PublishSubject<List<Contact>> _collectionSubject = PublishSubject();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<int> get count$ => _countSubject.stream;

  Stream<List<Contact>> get browse$ => _collectionSubject.stream;

  ContactManager() {
    _filterSubject
        .debounceTime(Duration(milliseconds: 500))
        .switchMap((query) async* {
      yield await ContactService.browse(query: query);
    })
        .listen((contacts) async {
      _collectionSubject.add(contacts);
    });

    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose() {
    _countSubject.close();
    _filterSubject.close();
  }
}