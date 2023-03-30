// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map json) => EventModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultEventModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
      message: json['message'] as String,
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
      'message': instance.message,
    };

ResultEventModel _$ResultEventModelFromJson(Map<String, dynamic> json) =>
    ResultEventModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      date: json['date'] as String?,
      desc: json['desc'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ResultEventModelToJson(ResultEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'desc': instance.desc,
      'image': instance.image,
    };
