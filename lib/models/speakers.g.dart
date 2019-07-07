// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speakers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speakers _$SpeakersFromJson(Map<String, dynamic> json) {
  return Speakers(
      title: json['title'] as String,
      listOfSpeakers: (json['listOfSpeakers'] as List)
          ?.map((e) =>
              e == null ? null : Speaker.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SpeakersToJson(Speakers instance) => <String, dynamic>{
      'title': instance.title,
      'listOfSpeakers': instance.listOfSpeakers
    };
