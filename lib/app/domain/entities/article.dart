import 'package:equatable/equatable.dart';

import '../../data/model/article.dart';

class Article extends Equatable {
  final bool status;
  final ResultArticleModel? result;
  final String message;
  const Article(
      {required this.status, required this.result, required this.message});

  @override
  List<Object> get props => [status, result ?? '', message];
}

class ResultArticle extends Equatable {
  final int? id;
  final String? title;
  final String? content;
  final String? image;
  final String? createDate;
  final String? createdBy;
  const ResultArticle(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.createDate,
      this.createdBy});

  @override
  List<Object> get props =>
      [id!, title!, content!, image!, createDate!, createdBy!];
}
