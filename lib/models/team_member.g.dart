// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamMember _$TeamMemberFromJson(Map<String, dynamic> json) {
  return TeamMember(
      name: json['name'] as String,
      title: json['title'] as String,
      photoUrl: json['photoUrl'] as String,
      socials: (json['socials'] as List)
          ?.map((e) =>
              e == null ? null : Social.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TeamMemberToJson(TeamMember instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'photoUrl': instance.photoUrl,
      'socials': instance.socials
    };
