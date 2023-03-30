// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidersModel _$SlidersModelFromJson(Map json) => SlidersModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultSlidersModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
      message: json['message'] as String,
    );

Map<String, dynamic> _$SlidersModelToJson(SlidersModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
      'message': instance.message,
    };

ResultSlidersModel _$ResultSlidersModelFromJson(Map<String, dynamic> json) =>
    ResultSlidersModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      type: json['type'] as int?,
      button: json['button'] as String?,
      desc: json['desc'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ResultSlidersModelToJson(ResultSlidersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'type': instance.type,
      'button': instance.button,
      'desc': instance.desc,
      'image': instance.image,
    };
