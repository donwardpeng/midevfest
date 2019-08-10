// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralInfo _$GeneralInfoFromJson(Map<String, dynamic> json) {
  return GeneralInfo(
    date: json['date'] as String,
    dateReadable: json['dateReadable'] as String,
    tracks: (json['tracks'] as List)
        ?.map(
            (e) => e == null ? null : Track.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GeneralInfoToJson(GeneralInfo instance) =>
    <String, dynamic>{
      'date': instance.date,
      'dateReadable': instance.dateReadable,
      'tracks': instance.tracks,
    };
