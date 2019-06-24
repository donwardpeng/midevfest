import 'package:json_annotation/json_annotation.dart';
import 'social.dart';

part 'team_member.g.dart';

@JsonSerializable()
class TeamMember{
TeamMember({this.name,
  this.photoUrl,
  this.socials,
  this.title,
  this.gdgLogoUrl,
  });
final String name;
final String title;
final String photoUrl;
final String gdgLogoUrl;
final List<Social> socials;
factory TeamMember.fromJson(Map<String, dynamic> json) => _$TeamMemberFromJson(json);
  Map<String, dynamic> toJson() => _$TeamMemberToJson(this);
}