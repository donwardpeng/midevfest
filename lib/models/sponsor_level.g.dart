// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SponsorLevel _$SponsorLevelFromJson(Map<String, dynamic> json) {
  return SponsorLevel(
      name: json['name'] as String,
      sponsors: (json['sponsors'] as List)
          ?.map((e) =>
              e == null ? null : Sponsor.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SponsorLevelToJson(SponsorLevel instance) =>
    <String, dynamic>{'name': instance.name, 'sponsors': instance.sponsors};
