import 'package:json_annotation/json_annotation.dart';
import 'social.dart';

part 'team.g.dart';

@JsonSerializable()
class Team{
Team({this.name,
  this.title,
  this.photoUrl,
  this.socials,
  
});
final String name;
final String title;
final String photoUrl;
final List<Social> socials;
factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}