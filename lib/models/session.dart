import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  Session(
      {this.id,
      this.title,
      this.description,
      this.speakers,
      this.language,
      this.complexity,
      this.tags});
  final int id;
  final String title;
  final String description;
  final List<int> speakers;
  final String language;
  final String complexity;
  final List<String> tags;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);
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
