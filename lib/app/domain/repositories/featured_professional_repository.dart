import 'package:artdesign/app/data/model/professional.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class FeaturedProfessionalRepository {
  Future<Either<Failure, List<ResultProfessionalModel>>> featuredprofessional();
}
