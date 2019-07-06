import 'package:json_annotation/json_annotation.dart';
import 'package:midevfest/models/general_info.dart';
import 'package:midevfest/models/timeslot.dart';

part 'schedule.g.dart';

@JsonSerializable()
class Schedule {
  Schedule({this.title, this.generalInfo, this.timeslots});
  final String title;
  final GeneralInfo generalInfo;
  final List<Timeslot> timeslots;
  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
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