// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      speakers: (json['speakers'] as List)?.map((e) => e as int)?.toList(),
      language: json['language'] as String,
      complexity: json['complexity'] as String,
      tags: (json['tags'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'speakers': instance.speakers,
      'language': instance.language,
      'complexity': instance.complexity,
      'tags': instance.tags
    };
