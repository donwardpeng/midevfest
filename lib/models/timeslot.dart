import 'package:json_annotation/json_annotation.dart';

part 'timeslot.g.dart';

@JsonSerializable()
class Timeslot {
  Timeslot({this.startTime, this.endTime, this.sessions});
  final String startTime;
  final String endTime;
  final List<List<int>> sessions;
  factory Timeslot.fromJson(Map<String, dynamic> json) => _$TimeslotFromJson(json);
  Map<String, dynamic> toJson() => _$TimeslotToJson(this);
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