// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    json['subject'] as String,
    json['body'] as String,
  );
}

// ignore: unused_element
Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'subject': instance.subject,
      'body': instance.body,
    };
