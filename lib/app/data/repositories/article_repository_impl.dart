import 'package:artdesign/app/data/datasources/article_local_datasource.dart';
import 'package:artdesign/app/data/model/article.dart';
import 'package:artdesign/app/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleDatasource articleDatasource;
  ArticleRepositoryImpl({required this.articleDatasource});

  @override
  Future<Either<Failure, List<ResultArticleModel>>> article() async {
    try {
      final response = await articleDatasource.article();
      return response.fold((failure) => Left(failure), (article) async {
        return Right(article);
      });
    } on Exception catch (_) {
      return const Left(Failure('Terjadi sebuah kesalahan'));
    }
  }
}
