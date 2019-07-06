// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sessions _$SessionsFromJson(Map<String, dynamic> json) {
  return Sessions(
      title: json['title'] as String,
      listOfSessions: (json['listOfSessions'] as List)
          ?.map((e) =>
              e == null ? null : Session.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SessionsToJson(Sessions instance) => <String, dynamic>{
      'title': instance.title,
      'listOfSessions': instance.listOfSessions
    };
