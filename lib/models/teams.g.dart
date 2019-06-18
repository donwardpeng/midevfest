// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teams _$TeamsFromJson(Map<String, dynamic> json) {
  return Teams(
      aListOfTeams: (json['aListOfTeams'] as List)
          ?.map((e) =>
              e == null ? null : Team.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TeamsToJson(Teams instance) =>
    <String, dynamic>{'aListOfTeams': instance.aListOfTeams};
