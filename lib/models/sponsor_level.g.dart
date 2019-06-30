// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SponsorLevel _$SponsorLevelFromJson(Map<String, dynamic> json) {
  return SponsorLevel(
      title: json['title'] as String,
      logos: (json['logos'] as List)
          ?.map((e) =>
              e == null ? null : Sponsor.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SponsorLevelToJson(SponsorLevel instance) =>
    <String, dynamic>{'title': instance.title, 'logos': instance.logos};
