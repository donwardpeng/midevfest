// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeslot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timeslot _$TimeslotFromJson(Map<String, dynamic> json) {
  return Timeslot(
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      sessions: (json['sessions'] as List)
          ?.map((e) =>
              e == null ? null : Session.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TimeslotToJson(Timeslot instance) => <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'sessions': instance.sessions
    };
