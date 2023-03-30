// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsModel _$ProjectsModelFromJson(Map json) => ProjectsModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultProjectsModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ProjectsModelToJson(ProjectsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
      'message': instance.message,
    };

ResultProjectsModel _$ResultProjectsModelFromJson(Map<String, dynamic> json) =>
    ResultProjectsModel(
      id: json['id'] as int?,
      professionalid: json['professionalid'] as int?,
      professional: json['professional'] as String?,
      logo: json['logo'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      detailProject: json['detailProject'] == null
          ? null
          : ResultDetailProjectsModel.fromJson(
              json['detailProject'] as Map<String, dynamic>),
      imageProject: json['imageProject'] == null
          ? null
          : ResultImageProjectsModel.fromJson(
              json['imageProject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultProjectsModelToJson(
        ResultProjectsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'professionalid': instance.professionalid,
      'professional': instance.professional,
      'logo': instance.logo,
      'title': instance.title,
      'desc': instance.desc,
      'detailProject': instance.detailProject?.toJson(),
      'imageProject': instance.imageProject?.toJson(),
    };

ResultDetailProjectsModel _$ResultDetailProjectsModelFromJson(
        Map<String, dynamic> json) =>
    ResultDetailProjectsModel(
      type: json['type'] as String?,
      size: json['size'] as String?,
      design: json['design'] as String?,
      architect: json['architect'] as String?,
      location: json['location'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ResultDetailProjectsModelToJson(
        ResultDetailProjectsModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'size': instance.size,
      'design': instance.design,
      'architect': instance.architect,
      'location': instance.location,
      'status': instance.status,
    };

ResultImageProjectsModel _$ResultImageProjectsModelFromJson(
        Map<String, dynamic> json) =>
    ResultImageProjectsModel(
      thumbnail: json['thumbnail'] as String?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ResultImageProjectsModelToJson(
        ResultImageProjectsModel instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'image': instance.image,
    };
