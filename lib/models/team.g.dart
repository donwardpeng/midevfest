// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
      name: json['name'] as String,
      title: json['title'] as String,
      photoUrl: json['photoUrl'] as String,
      socials: (json['socials'] as List)
          ?.map((e) =>
              e == null ? null : Social.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'photoUrl': instance.photoUrl,
      'socials': instance.socials
    };
