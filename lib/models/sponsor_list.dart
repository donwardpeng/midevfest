import 'package:json_annotation/json_annotation.dart';
import 'sponsor_level.dart';

part 'sponsor_list.g.dart';

@JsonSerializable()
class SponsorList {
  SponsorList({this.title, this.levels});

  final String title;
  final List<SponsorLevel> levels;
  factory SponsorList.fromJson(Map<String, dynamic> json) => _$SponsorListFromJson(json);
  Map<String, dynamic> toJson() => _$SponsorListToJson(this);

}
