import 'package:json_annotation/json_annotation.dart';
import 'team_member.dart';

part 'team.g.dart';

@JsonSerializable()
class Team {
  Team({this.title, this.members});

  final String title;
  final List<TeamMember> members;
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);

}
