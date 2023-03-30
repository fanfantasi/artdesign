// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfessionalModel _$ProfessionalModelFromJson(Map json) => ProfessionalModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultProfessionalModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ProfessionalModelToJson(ProfessionalModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
      'message': instance.message,
    };

ResultProfessionalModel _$ResultProfessionalModelFromJson(
        Map<String, dynamic> json) =>
    ResultProfessionalModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      categoryid: json['categoryid'] as int?,
      category: json['category'] as String?,
      city: json['city'] as String?,
      location: json['location'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      instagram: json['instagram'] as String?,
      whatsapp: json['whatsapp'] as String?,
      logo: json['logo'] as String?,
      background: json['background'] as String?,
      about: json['about'] as String?,
    );

Map<String, dynamic> _$ResultProfessionalModelToJson(
        ResultProfessionalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'categoryid': instance.categoryid,
      'category': instance.category,
      'city': instance.city,
      'location': instance.location,
      'phone': instance.phone,
      'website': instance.website,
      'instagram': instance.instagram,
      'whatsapp': instance.whatsapp,
      'logo': instance.logo,
      'background': instance.background,
      'about': instance.about,
    };
