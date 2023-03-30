import 'package:artdesign/app/data/model/banner.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class SlidersRepository {
  Future<Either<Failure, List<ResultSlidersModel>>> sliders();
}
