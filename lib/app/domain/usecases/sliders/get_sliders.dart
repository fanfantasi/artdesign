import 'package:artdesign/app/data/model/banner.dart';
import 'package:artdesign/app/domain/repositories/sliders_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetRemoteSliders implements UseCase<List<ResultSlidersModel>, NoParams> {
  late SlidersRepository repository;
  GetRemoteSliders(this.repository);

  @override
  Future<Either<Failure, List<ResultSlidersModel>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.sliders();
  }
}
