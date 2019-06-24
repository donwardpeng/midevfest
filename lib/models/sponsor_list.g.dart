// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SponsorList _$SponsorListFromJson(Map<String, dynamic> json) {
  return SponsorList(
      title: json['title'] as String,
      levels: (json['levels'] as List)
          ?.map((e) => e == null
              ? null
              : SponsorLevel.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SponsorListToJson(SponsorList instance) =>
    <String, dynamic>{'title': instance.title, 'levels': instance.levels};
