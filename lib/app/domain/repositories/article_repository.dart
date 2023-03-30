import 'package:artdesign/app/data/model/article.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<ResultArticleModel>>> article();
}
