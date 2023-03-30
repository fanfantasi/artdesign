import 'package:artdesign/app/data/model/banner.dart';
import 'package:artdesign/app/domain/repositories/sliders_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../datasources/remote/sliders_datasource.dart';

class SlidersRepositoryImpl implements SlidersRepository {
  final SlidersRemoteDatasource slidersDatasource;
  SlidersRepositoryImpl({required this.slidersDatasource});

  @override
  Future<Either<Failure, List<ResultSlidersModel>>> sliders() async {
    try {
      final response = await slidersDatasource.slidersRemote();
      return response.fold((failure) => Left(failure), (s) async {
        return Right(s);
      });
    } on Exception catch (_) {
      return const Left(Failure('Terjadi sebuah kesalahan'));
    }
  }
}
