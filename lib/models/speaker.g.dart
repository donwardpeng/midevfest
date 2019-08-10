// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) {
  return Speaker(
    id: json['id'] as int,
    featured: json['featured'] as bool,
    name: json['name'] as String,
    title: json['title'] as String,
    company: json['company'] as String,
    companyLogo: json['companyLogo'] as String,
    country: json['country'] as String,
    photoUrl: json['photoUrl'] as String,
    shortBio: json['shortBio'] as String,
    bio: json['bio'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    badges: (json['badges'] as List)?.map((e) => e as String)?.toList(),
    socials: (json['socials'] as List)
        ?.map((e) =>
            e == null ? null : Social.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SpeakerToJson(Speaker instance) => <String, dynamic>{
      'id': instance.id,
      'featured': instance.featured,
      'name': instance.name,
      'title': instance.title,
      'company': instance.company,
      'companyLogo': instance.companyLogo,
      'country': instance.country,
      'photoUrl': instance.photoUrl,
      'shortBio': instance.shortBio,
      'bio': instance.bio,
      'tags': instance.tags,
      'badges': instance.badges,
      'socials': instance.socials,
    };
