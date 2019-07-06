import 'package:json_annotation/json_annotation.dart';
import './session.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  Track({this.title});
  final String title;
  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}

// {
//   "title": "Schedule",
//   "generalInfo": {
//     "date": "2018-11-10",
//     "dateReadable": "November 10, 2018",
//     "tracks": [
//       {
//         "title": "Room 1"
//       },
//       {
//         "title": "Room 2"
//       }
//     ]
//   },
//   "timeslots": [
//     {
//       "startTime": "08:15",
//       "endTime": "8:45",
//       "sessions": [[101], [102]]
//     },