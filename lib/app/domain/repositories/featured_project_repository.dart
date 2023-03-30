import 'package:artdesign/app/data/model/projects.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class FeaturedProjectRepository {
  Future<Either<Failure, List<ResultProjectsModel>>> featuredprojects();
}
