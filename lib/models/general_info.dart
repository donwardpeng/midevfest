import 'package:json_annotation/json_annotation.dart';
import './track.dart';

part 'general_info.g.dart';

@JsonSerializable()
class GeneralInfo {
  GeneralInfo({this.date, this.dateReadable, this.tracks});
  final String date;
  final String dateReadable;
  final List<Track> tracks;
  factory GeneralInfo.fromJson(Map<String, dynamic> json) => _$GeneralInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GeneralInfoToJson(this);
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