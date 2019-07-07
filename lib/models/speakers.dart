import 'package:json_annotation/json_annotation.dart';
import 'speaker.dart';

part 'speakers.g.dart';

@JsonSerializable()
class Speakers {
  Speakers({this.title, this.listOfSpeakers,});
  final String title;
  final List<Speaker> listOfSpeakers;
  factory Speakers.fromJson(Map<String, dynamic> json) => _$SpeakersFromJson(json);
  Map<String, dynamic> toJson() => _$SpeakersToJson(this);
}
