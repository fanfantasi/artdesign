import 'package:artdesign/app/data/datasources/featured_projects_local_datasource.dart';
import 'package:artdesign/app/data/model/projects.dart';
import 'package:artdesign/app/domain/repositories/featured_project_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

class FeaturedProjectRepositoryImpl implements FeaturedProjectRepository {
  final FeaturedProjectsDatasource projectDatasource;
  FeaturedProjectRepositoryImpl({required this.projectDatasource});

  @override
  Future<Either<Failure, List<ResultProjectsModel>>> featuredprojects() async {
    try {
      final response = await projectDatasource.featuredprojects();
      return response.fold((failure) => Left(failure), (projects) async {
        return Right(projects);
      });
    } on Exception catch (_) {
      return const Left(Failure('Terjadi sebuah kesalahan'));
    }
  }
}
