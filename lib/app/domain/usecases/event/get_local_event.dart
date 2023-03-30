import 'package:artdesign/app/data/model/event.dart';
import 'package:artdesign/app/domain/repositories/event_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetLocalEvent implements UseCase<List<ResultEventModel>, NoParams> {
  late EventRepository repository;
  GetLocalEvent(this.repository);

  @override
  Future<Either<Failure, List<ResultEventModel>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.event();
  }
}
