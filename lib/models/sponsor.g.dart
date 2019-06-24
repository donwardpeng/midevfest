// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sponsor _$SponsorFromJson(Map<String, dynamic> json) {
  return Sponsor(
      name: json['name'] as String,
      url: json['url'] as String,
      logoUrl: json['logoUrl'] as String,
      width: json['width'] as int,
      height: json['height'] as int);
}

Map<String, dynamic> _$SponsorToJson(Sponsor instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'logoUrl': instance.logoUrl,
      'width': instance.width,
      'height': instance.height
    };
