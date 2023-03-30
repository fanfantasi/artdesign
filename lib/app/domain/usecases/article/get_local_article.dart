import 'package:artdesign/app/data/model/article.dart';
import 'package:artdesign/app/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetLocalArticle implements UseCase<List<ResultArticleModel>, NoParams> {
  late ArticleRepository repository;
  GetLocalArticle(this.repository);

  @override
  Future<Either<Failure, List<ResultArticleModel>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.article();
  }
}
