import 'package:artdesign/app/data/datasources/event_local_datasource.dart';
import 'package:artdesign/app/data/model/event.dart';
import 'package:artdesign/app/domain/repositories/event_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

class EventRepositoryImpl implements EventRepository {
  final EventDatasource eventDatasource;
  EventRepositoryImpl({required this.eventDatasource});

  @override
  Future<Either<Failure, List<ResultEventModel>>> event() async {
    try {
      final response = await eventDatasource.event();
      return response.fold((failure) => Left(failure), (banner) async {
        return Right(banner);
      });
    } on Exception catch (_) {
      return const Left(Failure('Terjadi sebuah kesalahan'));
    }
  }
}
