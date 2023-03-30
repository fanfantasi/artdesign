import 'package:artdesign/app/data/model/projects.dart';
import 'package:artdesign/app/domain/repositories/featured_project_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetLocalFeaturedProjects
    implements UseCase<List<ResultProjectsModel>, NoParams> {
  late FeaturedProjectRepository repository;
  GetLocalFeaturedProjects(this.repository);

  @override
  Future<Either<Failure, List<ResultProjectsModel>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.featuredprojects();
  }
}
