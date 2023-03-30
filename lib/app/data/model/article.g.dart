// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map json) => ArticleModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultArticleModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
      'message': instance.message,
    };

ResultArticleModel _$ResultArticleModelFromJson(Map<String, dynamic> json) =>
    ResultArticleModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      image: json['image'] as String?,
      createDate: json['createDate'] as String?,
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$ResultArticleModelToJson(ResultArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'createDate': instance.createDate,
      'createdBy': instance.createdBy,
    };
