import 'package:json_annotation/json_annotation.dart';
import 'sponsor.dart';

part 'sponsor_level.g.dart';

@JsonSerializable()
class SponsorLevel {
  SponsorLevel({this.name, this.sponsors});
  final String name;
  final List<Sponsor> sponsors;
  factory SponsorLevel.fromJson(Map<String, dynamic> json) => _$SponsorLevelFromJson(json);
  Map<String, dynamic> toJson() => _$SponsorLevelToJson(this);
}
