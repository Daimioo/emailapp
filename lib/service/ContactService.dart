import 'dart:convert';

import 'package:emailapp/model/Contact.dart';
import 'package:http/http.dart' as http;

class ContactService {
  static String _url = "https://polydactyl-tremendous-mine.glitch.me/contacts";

  static Future<List<Contact>> browse({String query}) async {
    http.Response response = await http.get("$_url?q=$query");
    
    String content = response.body;
    List collection = json.decode(content);
    Iterable<Contact> _contacts = collection.map((_) => Contact.fromJson(_));

    return _contacts.toList();
  }
}