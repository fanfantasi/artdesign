import 'package:artdesign/app/domain/entities/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ArticleModel extends Article {
  const ArticleModel(
      {required bool status,
      required ResultArticleModel? result,
      required String message})
      : super(status: status, result: result, message: message);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultArticleModel extends ResultArticle {
  const ResultArticleModel(
      {int? id,
      String? title,
      String? content,
      String? image,
      String? createDate,
      String? createdBy})
      : super(
            id: id,
            title: title,
            content: content,
            image: image,
            createDate: createDate,
            createdBy: createdBy);

  factory ResultArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ResultArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultArticleModelToJson(this);
}
