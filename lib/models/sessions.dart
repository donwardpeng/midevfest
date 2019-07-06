import 'package:json_annotation/json_annotation.dart';
import './session.dart';

part 'sessions.g.dart';

@JsonSerializable()
class Sessions {
  Sessions({this.title, this.listOfSessions});
  final String title;
  final List<Session> listOfSessions;
  
  factory Sessions.fromJson(Map<String, dynamic> json) => _$SessionsFromJson(json);
  Map<String, dynamic> toJson() => _$SessionsToJson(this);
}

  // "title": "Sessions",
  // "listOfSessions": [
  //     {
  //       "id": 101,
  //       "title": "Doors Open & Registration",
  //       "description": "Doors Open & Registration.",
  //       "speakers": [],
  //       "language": "English",
  //       "complexity": "",
  //       "tags": ["Welcome"]
  //     },