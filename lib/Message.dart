import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json)
    => _$MessageFromJson(json);

  static Future<List<Message>> browse({status = 'important'}) async {
    String url = status == 'important'
        ? 'https://run.mocky.io/v3/7b04647d-912b-49e0-9893-5b31b6e6ffa2'
        : 'https://run.mocky.io/v3/2019f5c4-f080-4c8e-9e1d-77f0213388da';

    http.Response response = await http.get(url);

    await Future.delayed(Duration(seconds: 1));

    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages = collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}