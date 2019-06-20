import 'package:json_annotation/json_annotation.dart';

part 'social.g.dart';

@JsonSerializable()
class Social {
  Social({this.icon, this.link, this.name});
  final String icon;
  final String link;
  final String name;
  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);
  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
