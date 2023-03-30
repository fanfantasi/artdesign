import 'package:artdesign/app/data/model/professional.dart';
import 'package:artdesign/app/domain/repositories/featured_professional_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../datasources/featured_professional_local_datasource.dart';

class FeaturedProfessionalRepositoryImpl
    implements FeaturedProfessionalRepository {
  final FeaturedProfessionalDatasource professionalDatasource;
  FeaturedProfessionalRepositoryImpl({required this.professionalDatasource});

  @override
  Future<Either<Failure, List<ResultProfessionalModel>>>
      featuredprofessional() async {
    try {
      final response = await professionalDatasource.professional();
      return response.fold((failure) => Left(failure), (projects) async {
        return Right(projects);
      });
    } on Exception catch (_) {
      return const Left(Failure('Terjadi sebuah kesalahan'));
    }
  }
}
