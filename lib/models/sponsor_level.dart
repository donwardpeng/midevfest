import 'package:json_annotation/json_annotation.dart';
import 'sponsor.dart';

part 'sponsor_level.g.dart';

@JsonSerializable()
class SponsorLevel {
  SponsorLevel({this.title, this.logos});
  final String title;
  final List<Sponsor> logos;
  factory SponsorLevel.fromJson(Map<String, dynamic> json) => _$SponsorLevelFromJson(json);
  Map<String, dynamic> toJson() => _$SponsorLevelToJson(this);
}
