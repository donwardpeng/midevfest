// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    title: json['title'] as String,
    generalInfo: json['generalInfo'] == null
        ? null
        : GeneralInfo.fromJson(json['generalInfo'] as Map<String, dynamic>),
    timeslots: (json['timeslots'] as List)
        ?.map((e) =>
            e == null ? null : Timeslot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'title': instance.title,
      'generalInfo': instance.generalInfo,
      'timeslots': instance.timeslots,
    };
