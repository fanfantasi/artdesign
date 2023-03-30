import 'package:artdesign/app/data/model/event.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class EventRepository {
  Future<Either<Failure, List<ResultEventModel>>> event();
}
