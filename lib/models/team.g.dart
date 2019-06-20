// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
      title: json['title'] as String,
      members: (json['members'] as List)
          ?.map((e) =>
              e == null ? null : TeamMember.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TeamToJson(Team instance) =>
    <String, dynamic>{'title': instance.title, 'members': instance.members};
